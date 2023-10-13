import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../common/models/attachment_widget.dart';
import '../../../../constants/color.dart';
import '../../../../constants/constants.dart';
import '../../../../gen/assets.gen.dart';
import '../../widgets/attach_widget.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController chatText = TextEditingController();

  bool isAttachmentBoxExpanded = false;

  void toggleIsAttachmentBoxExpanded() {
    setState(() {
      isAttachmentBoxExpanded = !isAttachmentBoxExpanded;
    });
  }

  void photoUploadHandler() {
    // Todo upload photo

    print('photoUploadHandler');
  }

  void videoCallHandler() {
    // Todo video call
    print('videoCallHandler');
  }

  void phoneCallHandler() {
    // Todo phone call
    print('phoneCallHandler');
  }

  void voiceRecordHandler() {
    // Todo voice record
    print('voiceRecordHandler');
  }

  void fileUploadHandler() {
    // Todo file upload

    print('fileUploadHandler');
  }

  void sendLocationHandler() {
    // Todo send location
    print('sendLocationHandler');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    List<AttachmentWidget> attachWidgets = [
      AttachmentWidget(
        icon: CupertinoIcons.photo,
        title: 'Photo Gallery',
        actionHandler: photoUploadHandler,
      ),
      AttachmentWidget(
        icon: Icons.mic,
        title: 'Voice Record',
        actionHandler: voiceRecordHandler,
      ),
      AttachmentWidget(
        icon: Icons.file_open_rounded,
        title: 'File Upload',
        actionHandler: fileUploadHandler,
      ),
      AttachmentWidget(
        icon: Icons.video_call,
        title: 'Video Call',
        actionHandler: videoCallHandler,
      ),
      AttachmentWidget(
        icon: Icons.add_call,
        title: 'Phone Call',
        actionHandler: phoneCallHandler,
      ),
      AttachmentWidget(
        icon: Icons.add_location_alt,
        title: 'Location',
        actionHandler: sendLocationHandler,
      ),
    ];

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: Builder(
            builder: (context) => GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: const Icon(
                Icons.chevron_left,
              ),
            ),
          ),
          centerTitle: false,
          title: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Container(
                height: 60.h,
                width: 50.w,
                decoration: BoxDecoration(
                  color: AppColors.primaryFourElementText.withOpacity(0.3),
                  shape: BoxShape.circle,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.network(AppConstants.defaultImg),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              const Text('Lorem Ipsum'),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                CupertinoIcons.videocam_fill,
                size: 30,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                CupertinoIcons.phone,
                size: 25,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                CupertinoIcons.ellipsis,
                size: 30,
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Stack(
            children: [
              Positioned(
                bottom: 70,
                child: AnimatedOpacity(
                  opacity: isAttachmentBoxExpanded ? 1 : 0,
                  duration: const Duration(milliseconds: 100),
                  child: Container(
                    height: 200.h,
                    width: 300.w,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade200,
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: GridView.builder(
                      itemCount: attachWidgets.length,
                      shrinkWrap: true,
                      padding: const EdgeInsets.only(top: 10),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 2,
                        mainAxisSpacing: 2,
                      ),
                      itemBuilder: (context, index) {
                        var item = attachWidgets[index];

                        return AttachWidget(
                          icon: item.icon,
                          title: item.title,
                          function: item.actionHandler,
                        );
                      },
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        bottomSheet: Container(
          margin: const EdgeInsets.only(bottom: 5),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 40.h,
                  width: 45.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primaryFourElementText.withOpacity(0.3),
                  ),
                  child: GestureDetector(
                    onTap: () => toggleIsAttachmentBoxExpanded(),
                    child: Icon(
                      isAttachmentBoxExpanded ? Icons.cancel : Icons.add,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  width: 290.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: Colors.grey.withOpacity(0.5),
                    ),
                  ),
                  child: TextFormField(
                    controller: chatText,
                    autofocus: true,
                    keyboardType: TextInputType.multiline,
                    textInputAction: TextInputAction.done,
                    maxLines: null,
                    onChanged: (value) {
                      setState(() {
                        isAttachmentBoxExpanded = false;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: "Type a message",
                      suffixIcon: GestureDetector(
                        onTap: () {},
                        child: const Icon(Icons.send),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      disabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
