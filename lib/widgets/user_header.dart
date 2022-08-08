import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:heal_monitor_flutter/util/network_util.dart';
import 'package:image_picker/image_picker.dart';

/*
  这个注释与下个注释之间的内容
  等待后端上线后修改
*/
Future<bool> _changeUserName(String newUsername) async {
  // int uid=想个办法弄到uid;
  // Response response=await NetworkUtil.postRequest("user/name", {"uid":uid,"username":newUsername},null);
  debugPrint("修改了用户名:$newUsername");
  return true;
}
Future<bool> _uploadAvatar(String image_path)async{
  // FormData formData=FormData.fromMap({"file":MultipartFile.fromFile(image_path),});
  // Response response=await NetworkUtil.postRequest("user/avatar", formData,null);
  debugPrint("选择了头像:$image_path");
  return true;
}

/* 结束 */
enum _UsernameEditState { onEditing, uploading, finish }

class UserHeader extends StatelessWidget {
  const UserHeader({Key? key, this.name, this.img}) : super(key: key);

  final String? name;
  final String? img;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5.0),
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 40.0),
      child: Row(
        children: [

          //这个LayoutBuilder用来让Text和Icon紧贴，并且Text不会因为超长溢出屏幕(所以没用Expanded(flex:0))
          Expanded(child: _UserName(name)),

          // const Expanded(child: SizedBox()),
          IconButton(onPressed: ()async{
            String?path=await _pickImage();
            if(path!=null)_uploadAvatar(path);
          }, icon: ClipOval(
              child: Image.network(
            img ?? 'https://www.sdu.edu.cn/images/logo.png',
            width: 90.0,
            height: 90.0,
            fit: BoxFit.cover,
          )),
          iconSize: 90.0,padding: EdgeInsets.zero,
          )
        ],
      ),
    );
  }
}
ImagePicker _picker=ImagePicker();
Future<String?>_pickImage()async{
  XFile?image=await _picker.pickImage(source: ImageSource.gallery);
  return image?.path;
}


class _UserName extends StatefulWidget {
  final String? name;

  const _UserName(this.name);

  @override
  State<StatefulWidget> createState() => _UserNameState();
}

class _UserNameState extends State<_UserName> {
  _UsernameEditState _state = _UsernameEditState.finish;
  late String name, newName;
  final TextEditingController controller = TextEditingController();

  void _finishEdit() async {
    if (newName == "" || newName == name) {
      setState(() {
        _state = _UsernameEditState.finish;
        if (newName == "") controller.text = name;
        newName = name;
      });
      return;
    }
    String oldName = name;
    setState(() {
      name = newName;
      _state = _UsernameEditState.uploading;
    });
    bool success = await _changeUserName(newName);
    setState(() {
      _state = _UsernameEditState.finish;
      if (!success) {
        name = oldName;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    name = widget.name ?? "DefaultUser";
    newName = name;
    controller.text = name;
  }

  @override
  Widget build(BuildContext context) {
    final double iconSize = IconTheme.of(context).size ?? 24;
    final Image editIcon = Image(
      image: const AssetImage("icons/编辑.png"),
      height: iconSize,
      width: iconSize,
    );
    return LayoutBuilder(
      builder: (context, constraint) {
        return Row(
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(
                  maxWidth: constraint.maxWidth -
                      iconSize -
                      24 /*源自IconButton的padding*/),
              child: _state != _UsernameEditState.onEditing
                  ? Text(
                      name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      textScaleFactor: 1.75,
                    )
                  : TextField(
                      autofocus: true,
                      controller: controller,
                      decoration: const InputDecoration(
                        isDense: true,
                      ),
                      cursorColor: Colors.white,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      onChanged: (val) {
                        setState(() {
                          newName = val;
                        });
                      },
                      onEditingComplete: () {
                        _finishEdit();
                      },
                    ),
            ),
            _state == _UsernameEditState.uploading
                ? SizedBox(
                    width: iconSize,
                    height: iconSize,
                    child: const CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  )
                : _state == _UsernameEditState.onEditing
                    ? IconButton(
                        onPressed: () {
                          _finishEdit();
                        },
                        icon: newName == "" || newName == name
                            ? const Icon(
                                Icons.clear,
                                color: Colors.white,
                              )
                            : const Icon(
                                Icons.done,
                                color: Colors.white,
                              ))
                    : IconButton(
                        onPressed: () {
                          setState(() {
                            _state = _UsernameEditState.onEditing;
                          });
                        },
                        icon: editIcon),
          ],
        );
      },
    );
  }
}
/*额外可以补充的功能*/
// 点击空白处取消TextField焦点 https://www.jianshu.com/p/cc444d992ae7
// 搜狗键盘收起但是TextField没有失去焦点解决方案 https://www.cnblogs.com/xsios/p/15821993.html