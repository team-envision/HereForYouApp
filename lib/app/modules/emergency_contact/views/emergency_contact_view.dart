import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:here_for_you_app/app/modules/emergency_contact/controllers/emergency_contact_controller.dart'; // Import the controller

class EmergencyContactView extends StatelessWidget {
  final EmergencyContactController _controller = Get.put(EmergencyContactController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            size: 35,
          ),
          onPressed: () {
            Get.back(); // Navigate to the previous screen
          },
        ),
        titleSpacing: -10, // Make title align close to the back button
        title: Text(
          'Emergency Contact',
          style: TextStyle(
            fontFamily: 'Urbanist',
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0, // Remove shadow
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Name Label and TextFormField with Shadow
              SizedBox(height: 20),
              Text(
                'Name',
                style: TextStyle(
                  fontFamily: 'Urbanist',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 7),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 3,
                      blurRadius: 6,
                      offset: Offset(0, 3), // Shadow position
                    ),
                  ],
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Enter emergency contact name',
                    filled: true, // Enable filling
                    fillColor: Colors.white, // Set the fill color to white
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(35), // Rounded corners
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal:14,vertical: 8), // Consistent height
                  ),
                  style: TextStyle(fontFamily: 'Urbanist'),
                  onSaved: (value) => _controller.name.value = value!,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a name';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 20),

              // Mobile Number Label and TextFormField with Shadow
              Text(
                'Mobile Number',
                style: TextStyle(
                  fontFamily: 'Urbanist',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 7),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 3,
                      blurRadius: 6,
                      offset: Offset(0, 3), // Shadow position
                    ),
                  ],
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Enter emergency contact number',
                    filled: true, // Enable filling
                    fillColor: Colors.white, // Set the fill color to white
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(35), // Rounded corners
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal:14,vertical: 8), // Consistent height
                  ),
                  keyboardType: TextInputType.phone,
                  style: TextStyle(fontFamily: 'Urbanist'),
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
              ),
              SizedBox(height: 20),

              // Email Label and TextFormField with Shadow
              Text(
                'Email',
                style: TextStyle(
                  fontFamily: 'Urbanist',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 7),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 3,
                      blurRadius: 6,
                      offset: Offset(0, 3), // Shadow position
                    ),
                  ],
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Enter emergency contact email',
                    filled: true, // Enable filling
                    fillColor: Colors.white, // Set the fill color to white
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(35),
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal:14,vertical: 8), // Consistent height
                  ),
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(fontFamily: 'Urbanist'),
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
              ),
              SizedBox(height: 20),

              // Relation Label and TextFormField with Shadow
              Text(
                'Relation',
                style: TextStyle(
                  fontFamily: 'Urbanist',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 7),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 3,
                      blurRadius: 6,
                      offset: Offset(0, 3), // Shadow position
                    ),
                  ],
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'How is emergency contact related to you?',
                    hintStyle: TextStyle(
                      fontFamily: 'Urbanist',
                      fontSize: 13,
                    ),
                    filled: true, // Enable filling
                    fillColor: Colors.white, // Set the fill color to white
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(35), // Rounded corners
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal:12,vertical: 8), // Consistent height
                  ),
                  style: TextStyle(fontFamily: 'Urbanist'),
                  onSaved: (value) => _controller.relation.value = value!,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the relation';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 30),

              // Save Button
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    _controller.saveDetails();
                  },
                  child: Text(
                    'Save Details',
                    style: TextStyle(
                      fontFamily: 'Urbanist',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: EdgeInsets.symmetric(horizontal: 105, vertical: 12),
                    textStyle: TextStyle(fontSize: 10),
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
