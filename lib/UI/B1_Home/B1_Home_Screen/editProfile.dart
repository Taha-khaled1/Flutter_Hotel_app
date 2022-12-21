import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotelbooking/ShardFunction/valid.dart';
import 'package:hotelbooking/UI/handlingView/handlingview.dart';
import 'package:hotelbooking/controller/edit_profile_controller.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    EditProfileController editProfileController =
        Get.put(EditProfileController());
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: const Text("Edit Profile",
            style: TextStyle(fontFamily: "Sofia", color: Colors.black)),
        actions: <Widget>[
          GetBuilder<EditProfileController>(
            builder: (controller) {
              return HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: Center(
                  child: InkWell(
                    onTap: () async {
                      controller.updateUser();
                    },
                    child: Padding(
                      padding: EdgeInsets.only(right: 10.0),
                      child: Text(
                        "Done",
                        style: TextStyle(
                          color: Color(0xFF7F53AC),
                          fontFamily: "Sofia",
                          fontWeight: FontWeight.w800,
                          fontSize: 17.0,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.bottomRight,
              width: 115,
              height: 115,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                image: DecorationImage(
                  image: AssetImage('assets/image/images/GirlProfile.png'),
                ),
              ),
              child: InkWell(
                onTap: () {},
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.grey,
                  child: Icon(Icons.camera_alt_outlined),
                ),
              ),
            ),
            Container(
              height: 420.0,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 15.0,
                    spreadRadius: 10.0,
                    color: Colors.black12.withOpacity(0.03),
                  )
                ],
              ),
              child: Form(
                key: editProfileController.formkeyedit,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 50.0,
                    ),
                    TextFieldEditing(
                      hint: 'mohamed',
                      onSaved: (p0) {
                        editProfileController.username = p0!;
                      },
                      validator: (p0) {
                        return validInput(p0.toString(), 2, 50, 'username');
                      },
                      titels: 'User name',
                    ),
                    Divider(
                      color: Colors.black12.withOpacity(0.1),
                      height: 0.3,
                    ),
                    TextFieldEditing(
                      hint: 'mohamed@gmail.com',
                      onSaved: (p0) {
                        editProfileController.email = p0!;
                      },
                      validator: (p0) {
                        return validInput(p0.toString(), 5, 100, 'email');
                      },
                      titels: 'Email',
                    ),
                    Divider(
                      color: Colors.black12.withOpacity(0.1),
                      height: 0.3,
                    ),
                    TextFieldEditing(
                      hint: '0123456789',
                      onSaved: (p0) {
                        editProfileController.phone = p0!;
                      },
                      validator: (p0) {
                        return validInput(
                          p0.toString(),
                          4,
                          50,
                          'phone',
                        );
                      },
                      titels: 'Phone',
                    ),
                    Divider(
                      color: Colors.black12.withOpacity(0.1),
                      height: 1.2,
                    ),
                    TextFieldEditing(
                      hint: 'Egypt',
                      onSaved: (p0) {
                        editProfileController.countery = p0!;
                      },
                      validator: (p0) {
                        return validInput(
                          p0.toString(),
                          2,
                          50,
                          'city',
                        );
                      },
                      titels: 'Citey',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TextFieldEditing extends StatelessWidget {
  const TextFieldEditing({
    Key? key,
    required this.titels,
    required this.hint,
    required this.onSaved,
    this.validator,
  }) : super(key: key);
  final String titels, hint;
  final void Function(String?) onSaved;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 15.0,
        right: 15.0,
        bottom: 10.0,
        top: 10.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            titels,
            style: TextStyle(
                fontFamily: "Sofia",
                color: Colors.black26,
                fontSize: 17.0,
                fontWeight: FontWeight.w700),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 40.0),
              child: TextFormField(
                initialValue: hint,
                onSaved: onSaved,
                validator: validator,
                decoration: InputDecoration(
                  hintText: hint,
                  hintStyle: const TextStyle(
                      fontFamily: "Sofia",
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 17.0),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.white,
                      width: 1.0,
                      style: BorderStyle.none,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
