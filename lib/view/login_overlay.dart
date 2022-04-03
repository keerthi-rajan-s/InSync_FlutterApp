import 'package:flutter/material.dart';
import 'package:insync/view/create_account_overlay.dart';
import 'package:insync/widgets/button.dart';
import 'package:insync/widgets/input_field.dart';

class LoginOverlay extends StatelessWidget {
  const LoginOverlay({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => Navigator.of(context).pop(),
      child: DraggableScrollableSheet(
        initialChildSize: 0.75,
        minChildSize: 0.4,
        builder: (_, controller) => Container(
          clipBehavior: Clip.hardEdge,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: ListView(
            controller: controller,
            // mainAxisSize: MainAxisSize.min,
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 16, 0, 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Log in",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              const InputField(
                label: "E-mail",
                placeholder: "someone@example.com",
                keyboard: TextInputType.emailAddress,
              ),
              const InputField(
                label: "Password",
                placeholder: "•••••••••••••",
                password: true,
              ),
              const SizedBox(height: 8),
              PrimaryButton(
                buttonTitle: "Continue",
                onPressed: () {},
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Divider(
                    color: Colors.grey,
                    height: 1,
                    thickness: 1,
                  ),
                  const Text("or"),
                  Container(
                    decoration: const BoxDecoration(
                      color: Color(0xff00baff),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              PrimaryButton(
                buttonTitle: "Log in with google",
                onPressed: () {},
                imageLeft: const Image(
                  image: AssetImage('assets/google.png'),
                  width: 26,
                  height: 28,
                ),
                bgColor: const Color(0xff1A1A1A),
              ),
              const SizedBox(height: 8),
              PrimaryButton(
                buttonTitle: "Log in with facebook",
                onPressed: () {},
                bgColor: Colors.white,
                imageLeft:
                    const Image(image: AssetImage('assets/facebook.png')),
                textColor: Colors.black,
                border: const BorderSide(color: Color(0xff1A1A1A), width: 2),
              ),
              const SizedBox(height: 8),
              PrimaryButton(
                buttonTitle: "New here? create an account",
                onPressed: () {
                  Navigator.pop(context);
                  showModalBottomSheet<void>(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (BuildContext context) {
                      return const CreateAccountOverlay();
                    },
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24)),
                    ),
                  );
                },
                bgColor: Colors.white,
                textColor: const Color(0xffBD3A4A),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
