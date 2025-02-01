import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:fruitsecommerce/core/helper_functions/build_error_bar.dart';
import 'package:provider/provider.dart';

import '../../../../../core/Service/stripe_service.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../domain/entites/order_entity.dart';
import '../../../domain/entites/paypal_payment_entity/paypal_payment_entity.dart';
import '../../manger/add_order_cubit/add_order_cubit.dart';
import 'checkout_steps.dart';
import 'checkout_steps_page_view.dart';

class CheckoutViewBody extends StatefulWidget {
  const CheckoutViewBody({super.key});

  @override
  State<CheckoutViewBody> createState() => _CheckoutViewBodyState();
}

class _CheckoutViewBodyState extends State<CheckoutViewBody> {
  late PageController pageController;
  ValueNotifier<AutovalidateMode> valueNotifier =
      ValueNotifier(AutovalidateMode.disabled);
  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      setState(() {
        currentPageIndex = pageController.page!.toInt();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    valueNotifier.dispose();
    super.dispose();
  }

  int currentPageIndex = 0;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          CheckoutSteps(
            onTap: (index) {
              if (currentPageIndex == 0) {
                pageController.animateToPage(index,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn);
              } else if (index == 1) {
                var orderEntity = context.read<OrderEntity>();
                if (orderEntity.payWithCash != null) {
                  pageController.animateToPage(index,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn);
                } else {
                  buildErrorBar(context, 'يرجي تحديد طريقه الدفع');
                }
              } else {
                _handleAddressValidation();
              }
            },
            pageController: pageController,
            currentPageIndex: currentPageIndex,
          ),
          Expanded(
            child: CheckoutStepsPageView(
              valueListenable: valueNotifier,
              pageController: pageController,
              formKey: _formKey,
            ),
          ),
          CustomButton(
              onPressed: () {
                if (currentPageIndex == 0) {
                  _handleShippingSectionValidation(context);
                } else if (currentPageIndex == 1) {
                  _handleAddressValidation();
                } else {
                  _processPayment(context);
                }
              },
              text: getNextButtonText(currentPageIndex)),
          const SizedBox(
            height: 32,
          ),
        ],
      ),
    );
  }

  void _handleShippingSectionValidation(BuildContext context) {
    if (context.read<OrderEntity>().payWithCash != null) {
      pageController.animateToPage(currentPageIndex + 1,
          duration: const Duration(milliseconds: 300), curve: Curves.bounceIn);
    } else {
      buildErrorBar(context, 'يرجي تحديد طريقه الدفع');
    }
  }

  String getNextButtonText(int currentPageIndex) {
    switch (currentPageIndex) {
      case 0:
        return 'التالي';
      case 1:
        return 'التالي';
      case 2:
        return 'الدفع عبر PayPal';
      default:
        return 'التالي';
    }
  }

  void _handleAddressValidation() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      pageController.animateToPage(currentPageIndex + 1,
          duration: const Duration(milliseconds: 300), curve: Curves.bounceIn);
    } else {
      valueNotifier.value = AutovalidateMode.always;
    }
  }


  void _processPayment(BuildContext context) {
    var orderEntity = context.read<OrderEntity>();
    PaypalPaymentEntity paypalPaymentEntity =
        PaypalPaymentEntity.fromEntity(orderEntity);
    var addOrderCubit = context.read<AddOrderCubit>();

    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => PaypalCheckoutView(
        sandboxMode: true,
        clientId: 'AdTbcj5wnf-SSf_ABsCd29b1RNiOGHE8Xn6I_SffvK0X_zUfNqxHYf_dhH9jyvC6nz_glCJ2ygupiAFY',
        secretKey: 'EB_qd7P4yvxTCClKDln8_5QqWF7oGYcC92W-BhIqZ_Ju_ikkG4SifmvEzONW9ALdjbSZPXSKWSzDsmMq',
        transactions: [
          paypalPaymentEntity.toJson(),
        ],
        note: "Contact us for any questions on your order.",
        onSuccess: (Map params) async {
          Navigator.pop(context);
          addOrderCubit.addOrder(order: orderEntity);
        },
        onError: (error) {
          Navigator.pop(context);
          log(error.toString());
          buildErrorBar(context, 'حدث خطأ في عملية الدفع');
        },
        onCancel: () {
          print('cancelled:');
        },
      ),
    ));
  }
}
