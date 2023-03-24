import 'dart:typed_data';

import 'package:artemis_webapp/appBarItems.dart';
import 'package:artemis_webapp/auth_methods/authMethods.dart';
import 'package:artemis_webapp/calendar/calendarSection.dart';
import 'package:artemis_webapp/config/responsive.dart';
import 'package:artemis_webapp/constants.dart';
import 'package:artemis_webapp/dashboard/dashboardDetails.dart';
import 'package:artemis_webapp/globalVariable.dart';
import 'package:artemis_webapp/navigation/profile/navBarProfile.dart';
import 'package:artemis_webapp/optionsList.dart';
import 'package:artemis_webapp/profile/profileScreen.dart';
import 'package:artemis_webapp/utils/textField.dart';
import 'package:artemis_webapp/utils/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multiselect/multiselect.dart';
import 'package:page_transition/page_transition.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:latlong2/latlong.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  final _formKey = GlobalKey<FormState>();
  Uint8List? _pickedImage;
  String? name;
  String? _path;

  Uint8List? file;

  String? fileName;
  String? imageUrl;

  List<String>? companySpecialtiesValue;
  String? companySizeValue;

  final TextEditingController _ownerNameController = TextEditingController();
  final TextEditingController _companyNameController = TextEditingController();
  final TextEditingController _companyEmailController = TextEditingController();
  final TextEditingController _companyAddressController =
      TextEditingController();
  final TextEditingController _companyPhoneController = TextEditingController();
  final TextEditingController _companyIndustryController =
      TextEditingController();
  final TextEditingController _companyFoundedController =
      TextEditingController();
  final TextEditingController _companySizeController = TextEditingController();
  final TextEditingController _companyWebsiteController =
      TextEditingController();
  final TextEditingController _companyDescriptionController =
      TextEditingController();

  // TextEditingController _companySpecialtiesController = TextEditingController()
  //   ..text = [].toString();

  //get user details
  var userData = {};
  Future<void> getUserDetails() async {
    final user = FirebaseAuth.instance.currentUser;
    final userRef =
        FirebaseFirestore.instance.collection('users').doc(user!.uid);

    final doc = await userRef.get();
    if (doc.exists) {
      setState(() {
        userData = doc.data()!;
        _ownerNameController.text = doc['ownerName'];
        _companyNameController.text = doc['companyName'];
        _companyEmailController.text = doc['companyEmail'];
        _companyAddressController.text = doc['companyAddress'];
        _companyPhoneController.text = doc['companyPhone'];
        _companyIndustryController.text = doc['companyIndustry'];
        _companyFoundedController.text = doc['companyFounded'];
        companySizeValue = doc['companySize'];
        _companyWebsiteController.text = doc['companyWebsite'];
        _companyDescriptionController.text = doc['companyDescription'];
        companySpecialtiesValue = doc['companySpecialties'];
        print('Company Name: ${doc['companyName']}');
      });
    }
  }

  void update() async {
    await AuthMethods().updateProfile(
      ownerName: _ownerNameController.text,
      companyName: _companyNameController.text,
      companyEmail: _companyEmailController.text,
      companyAddress: _companyAddressController.text,
      companyPhone: _companyPhoneController.text,
      companyIndustry: _companyIndustryController.text,
      companyFounded: _companyFoundedController.text,
      companySize: companySizeValue.toString(),
      companyWebsite: _companyWebsiteController.text,
      companyDescription: _companyDescriptionController.text,
      companySpecialties: companySpecialtiesValue.toString(),
    );
  }

  void updatePic() async {
    Reference ref = FirebaseStorage.instance
        .ref()
        .child("companyLogo/${_companyNameController.text}/$name");
    UploadTask task =
        ref.putData(_pickedImage!, SettableMetadata(contentType: 'image/jpeg'));
    TaskSnapshot snapshot = await task;
    String imageUrl = await snapshot.ref.getDownloadURL();

    print('==========================================');
    print(imageUrl);
    print('==========================================');
    final user = FirebaseAuth.instance.currentUser;
    final userRef =
        FirebaseFirestore.instance.collection('users').doc(user!.uid);

    await userRef.update({
      'imageUrl': imageUrl,
    });
  }

  //image picker using file picker
  void _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      var f = await image.readAsBytes();
      var a = await image.name;
      var s = await image.path;
      setState(() {
        _pickedImage = f;
        name = a;
        _path = s;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getUserDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      drawer: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: const [
            SizedBox(
              width: 260,
              child: NavBarProfile(),
            ),
          ],
        ),
      ),
      appBar: !Responsive.isDesktop(context)
          ? AppBar(
              elevation: 0,
              backgroundColor: AppColors.white,
              leading: IconButton(
                  onPressed: () {
                    _drawerKey.currentState!.openDrawer();
                  },
                  icon: const Icon(Icons.menu, color: AppColors.black)),
              actions: const [
                AppBarActionItems(),
              ],
            )
          : const PreferredSize(
              preferredSize: Size.zero,
              child: SizedBox(),
            ),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (Responsive.isDesktop(context))
              const Expanded(
                flex: 2,
                child: NavBarProfile(),
              ),
            Expanded(
              flex: 10,
              child: SafeArea(
                child: Form(
                  key: _formKey,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 1.5,
                    child: SingleChildScrollView(
                      padding:
                          const EdgeInsets.only(top: 30, left: 50, right: 50),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('Edit Company Profile',
                                            style: AppTextStyles.headings),
                                        Text(
                                          'subtitle',
                                          style: AppTextStyles.subHeadings,
                                        ),
                                      ]),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        update();
                                        updatePic();
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ProfileScreen()));
                                      },
                                      style: ButtonStyle(
                                        padding: MaterialStateProperty.all(
                                            const EdgeInsets.symmetric(
                                                vertical: 20.0,
                                                horizontal: 40)),
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                AppColors.blueAccent),
                                        shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                        ),
                                        shadowColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.transparent),
                                      ),
                                      child: Text('Save',
                                          style: TextStyle(
                                            color: AppColors.white,
                                            fontSize: 15,
                                          )),
                                    ),
                                    SizedBox(
                                      width: 20.0,
                                    ),
                                    ElevatedButton(
                                      onPressed: (() {
                                        Navigator.push(
                                            context,
                                            PageTransition(
                                                type: PageTransitionType.fade,
                                                duration: const Duration(
                                                    milliseconds: 500),
                                                child: const ProfileScreen()));
                                      }),
                                      style: ButtonStyle(
                                        padding: MaterialStateProperty.all(
                                            const EdgeInsets.symmetric(
                                                vertical: 20.0,
                                                horizontal: 40)),
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                AppColors.greyAccent),
                                        shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                        ),
                                        shadowColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.transparent),
                                      ),
                                      child: Text('Cancel',
                                          style: TextStyle(
                                            color: AppColors.black,
                                            fontSize: 15,
                                          )),
                                    ),
                                  ],
                                ),
                              ]),
                          const SizedBox(
                            height: 40,
                          ),
                          Wrap(
                            spacing: 20,
                            runSpacing: 20,
                            alignment: WrapAlignment.start,
                            children: [
                              Container(
                                //padding: EdgeInsets.all(30),
                                width: MediaQuery.of(context).size.width / 3.8,
                                height: 795,
                                decoration: BoxDecoration(
                                  borderRadius: Decorations.borderRadius,
                                  color: AppColors.white,
                                  boxShadow: [
                                    Decorations.boxShadow,
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(15.0),
                                      child: Container(
                                        margin: EdgeInsets.only(
                                            top: 30, left: 30, right: 30),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                          border: Border.all(
                                            color: AppColors.greyAccent,
                                            width: 2,
                                          ),
                                          color: AppColors.white,
                                        ),
                                        padding: EdgeInsets.all(15),
                                        width:
                                            MediaQuery.of(context).size.width /
                                                    3.8 -
                                                60,
                                        height: 250,
                                        child: Stack(
                                          children: [
                                            Align(
                                              alignment: Alignment.center,
                                              child: _pickedImage != null
                                                  ? CircleAvatar(
                                                      radius: 50,
                                                      backgroundImage:
                                                          MemoryImage(
                                                              _pickedImage!),
                                                      backgroundColor:
                                                          AppColors.greyAccent,
                                                    )
                                                  : const CircleAvatar(
                                                      radius: 50,
                                                      backgroundImage: NetworkImage(
                                                          'https://i.stack.imgur.com/l60Hf.png'),
                                                      backgroundColor:
                                                          AppColors.greyAccent,
                                                    ),
                                            ),
                                            Align(
                                              alignment: Alignment.bottomRight,
                                              child: Container(
                                                  height: 40,
                                                  width: 40,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: AppColors.lightblue,
                                                  ),
                                                  child: InkWell(
                                                    onTap: () async {
                                                      _pickImage();
                                                    },
                                                    child: Icon(
                                                      Icons.edit,
                                                      color:
                                                          AppColors.blueAccent,
                                                    ),
                                                  )),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                        height: 795 - 250 - 50,
                                        child: SingleChildScrollView(
                                          scrollDirection: Axis.vertical,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(height: 15.0),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 30, right: 30),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text("Company Details",
                                                        style: AppTextStyles
                                                            .title),
                                                    Text(
                                                        "This will be displayed to the profile page.",
                                                        style: AppTextStyles
                                                            .subtitle3),
                                                    TextFieldInput(
                                                      labelText: "Owner Name",
                                                      textEditingController:
                                                          _ownerNameController,
                                                    ),
                                                    TextFieldInput(
                                                      labelText: "Company Name",
                                                      textEditingController:
                                                          _companyNameController,
                                                    ),
                                                    TextFieldInput(
                                                      labelText:
                                                          "Company Email",
                                                      textEditingController:
                                                          _companyEmailController,
                                                    ),
                                                    TextFieldInput(
                                                      labelText:
                                                          "Company Phone",
                                                      textEditingController:
                                                          _companyPhoneController,
                                                    ),
                                                    TextFieldInput(
                                                      labelText:
                                                          "Company Address",
                                                      textEditingController:
                                                          _companyAddressController,
                                                    ),
                                                    TextFieldInput(
                                                      labelText:
                                                          "Company Address",
                                                      textEditingController:
                                                          _companyAddressController,
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        )),
                                  ],
                                ),
                              ),
                              Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(30),
                                    width: MediaQuery.of(context).size.width /
                                        3.35,
                                    height: 795 / 2 - 10,
                                    decoration: BoxDecoration(
                                      borderRadius: Decorations.borderRadius,
                                      color: AppColors.white,
                                      boxShadow: [
                                        Decorations.boxShadow,
                                      ],
                                    ),
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.vertical,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text("Company Profile",
                                                  style: AppTextStyles.title),
                                              Text(
                                                  "This is the information that will be displayed on your company profile page.",
                                                  style:
                                                      AppTextStyles.subtitle3),
                                              TextFieldInput(
                                                labelText: "Company Industry",
                                                textEditingController:
                                                    _companyIndustryController,
                                              ),
                                              TextFieldInput(
                                                labelText:
                                                    "Company Year Founded",
                                                textEditingController:
                                                    _companyFoundedController,
                                              ),
                                              Container(
                                                height: 50,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    3.6,
                                                padding: const EdgeInsets.only(
                                                    left: 20, right: 20),
                                                margin: const EdgeInsets.only(
                                                    top: 20),
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  border: Border.all(
                                                      color: AppColors
                                                          .greyAccentLine),
                                                ),
                                                child:
                                                    DropdownButtonHideUnderline(
                                                  child: DropdownButton2(
                                                    hint: Text(
                                                      'Select Company Size',
                                                      style: AppTextStyles
                                                          .subtitle3,
                                                    ),
                                                    items: sizeOptions
                                                        .map((item) =>
                                                            DropdownMenuItem<
                                                                String>(
                                                              value: item,
                                                              child: Text(item,
                                                                  style: AppTextStyles
                                                                      .title2),
                                                            ))
                                                        .toList(),
                                                    value: companySizeValue,
                                                    onChanged: (value) {
                                                      setState(() {
                                                        companySizeValue =
                                                            value.toString();
                                                      });
                                                    },
                                                    buttonHeight: 40,
                                                    buttonWidth: 140,
                                                    itemHeight: 40,
                                                  ),
                                                ),
                                              ),
                                              TextFieldInput(
                                                labelText: "Company Website",
                                                textEditingController:
                                                    _companyWebsiteController,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(30),
                                    width: MediaQuery.of(context).size.width /
                                        3.35,
                                    height: 795 / 2 - 10,
                                    decoration: BoxDecoration(
                                      borderRadius: Decorations.borderRadius,
                                      color: AppColors.white,
                                      boxShadow: [
                                        Decorations.boxShadow,
                                      ],
                                    ),
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.vertical,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text("Company Overview",
                                                  style: AppTextStyles.title),
                                              Text(
                                                  "This is the information that will be displayed on your company profile page.",
                                                  style:
                                                      AppTextStyles.subtitle3),
                                              Container(
                                                height: 180,
                                                padding: const EdgeInsets.only(
                                                    left: 20, right: 20),
                                                margin: const EdgeInsets.only(
                                                    top: 20),
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  border: Border.all(
                                                      color: AppColors
                                                          .greyAccentLine),
                                                ),
                                                child: TextFormField(
                                                  autofocus: false,
                                                  controller:
                                                      _companyDescriptionController,
                                                  style: AppTextStyles.title2,
                                                  keyboardType:
                                                      TextInputType.multiline,
                                                  maxLines: null,
                                                  decoration: InputDecoration(
                                                    labelText:
                                                        'Company Description',
                                                    labelStyle:
                                                        AppTextStyles.subtitle3,
                                                    border: InputBorder.none,
                                                  ),
                                                  validator: (String? value) {
                                                    if (value == null ||
                                                        value.trim().isEmpty) {
                                                      return "required";
                                                    }
                                                    return null;
                                                  },
                                                ),
                                              ),
                                              Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    3.6,
                                                padding: const EdgeInsets.only(
                                                    top: 5,
                                                    bottom: 5,
                                                    left: 10,
                                                    right: 20),
                                                margin: const EdgeInsets.only(
                                                    top: 20),
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  border: Border.all(
                                                      color: AppColors
                                                          .greyAccentLine),
                                                ),
                                                child: DropDownMultiSelect(
                                                    decoration:
                                                        const InputDecoration(
                                                      border: InputBorder.none,
                                                    ),
                                                    onChanged: (List<String>
                                                        specialties) {
                                                      setState(() {
                                                        companySpecialtiesValue =
                                                            specialties;
                                                      });
                                                    },
                                                    hint: Text(
                                                      'Select Specialties',
                                                      style: AppTextStyles
                                                          .subtitle3,
                                                    ),
                                                    options: specialtiesOptions,
                                                    selectedValues:
                                                        companySpecialtiesValue ??
                                                            []),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                height: 795 / 2 - 10,
                                margin: EdgeInsets.only(bottom: 30),
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  borderRadius: Decorations.borderRadius,
                                  color: AppColors.black,
                                  boxShadow: [
                                    Decorations.boxShadow,
                                  ],
                                ),
                                child: ClipRRect(
                                  borderRadius: Decorations.borderRadius,
                                  child: FlutterMap(
                                      options: MapOptions(
                                        center: LatLng(14.2770192, 120.7544523),
                                        zoom: 13.0,
                                      ),
                                      children: [
                                        TileLayer(
                                          urlTemplate:
                                              "https://api.tomtom.com/map/1/tile/basic/main/"
                                              "{z}/{x}/{y}.png?key={apiKey}",
                                          additionalOptions: {"apiKey": apiKey},
                                        ),
                                        MarkerLayer(markers: [
                                          Marker(
                                              point: LatLng(
                                                  14.2770192, 120.7544523),
                                              builder: (context) => Icon(
                                                  Icons.location_on,
                                                  color: Colors.red,
                                                  size: 40.0))
                                        ])
                                      ]),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            if (Responsive.isDesktop(context))
              Expanded(
                flex: 4,
                child: SafeArea(
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height,
                    decoration: const BoxDecoration(
                      color: AppColors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(8, 114, 114, 114),
                          blurRadius: 25,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(
                          vertical: 30, horizontal: 20),
                      child: Column(
                        children: const [
                          AppBarActionItems(),
                          SizedBox(height: 15),
                          CalendarSection(),
                          DashboardDetails()
                        ],
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
