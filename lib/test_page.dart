import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:transparent_image/transparent_image.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Column(
        children: [
          FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image:
                  "https://images.unsplash.com/photo-1476673160081-cf065607f449?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=80&raw_url=true&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2372"),
          ElevatedButton(
              onPressed: () async {
                // save image action
                var response = await http.get(Uri.parse(
                    "https://images.unsplash.com/photo-1476673160081-cf065607f449?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=80&raw_url=true&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2372"));
                ImageGallerySaver.saveImage(response.bodyBytes,
                    name: "savedImage");
              },
              child: const Text("Save This Image"))
        ],
      ),
    ));
  }
}
