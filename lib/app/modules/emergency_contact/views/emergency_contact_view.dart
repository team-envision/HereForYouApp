import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:here_for_you_app/app/modules/emergency_contact/controllers/emergency_contact_controller.dart';
import '../../../../Components/kCustomtextfield.dart';
import '../../../../Components/kElevatedButton.dart';

class EmergencyContactView extends StatelessWidget {
  final EmergencyContactController _controller = Get.put(EmergencyContactController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            size: 35,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        titleSpacing: -5,
        title: const Text(
          'Emergency Contact',
          style: TextStyle(
            fontFamily: 'fontmain',
            fontWeight: FontWeight.w900,
            fontSize: 25,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),

              CustomTextField(
                label: 'Name',
                hintText: 'Enter emergency contact name',
                onSaved: (value) => _controller.name.value = value!,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              CustomTextField(
                label: 'Mobile Number',
                hintText: 'Enter emergency contact number',
                keyboardType: TextInputType.phone,
                onSaved: (value) => _controller.mobileNumber.value = value!,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a mobile number';
                  }
                  if (value.length != 10) {
                    return 'Mobile number should be 10 digits';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              CustomTextField(
                label: 'Email',
                hintText: 'Enter emergency contact email',
                keyboardType: TextInputType.emailAddress,
                onSaved: (value) => _controller.email.value = value!,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an email';
                  }
                  if (!GetUtils.isEmail(value)) {
                    return 'Enter a valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              CustomTextField(
                label: 'Relation',
                hintText: 'How is emergency contact related to you?',
                onSaved: (value) => _controller.relation.value = value!,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the relation';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30),

              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: kElevatedButton(
                    text: 'Save Details',
                    onPressed: () {
                      if (_controller.formKey.currentState!.validate()) {
                        _controller.formKey.currentState!.save();
                        // Perform save action
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
