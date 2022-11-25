import 'package:flutter/material.dart';
import 'package:menuproject/data/menu_dao.dart';

class MenuOptions extends StatefulWidget {
  final String menuoption;
  final String priceoption;
  final String optionphoto;

  MenuOptions(this.menuoption, this.priceoption, this.optionphoto,
      {Key? key})
      : super(key: key);

  @override
  State<MenuOptions> createState() => _MenuOptionsState();
}

class _MenuOptionsState extends State<MenuOptions> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: Colors.white),
        height: 150,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ElevatedButton(
                    onLongPress: () {
                      MenuDao().delete(widget.menuoption);
                    },
                    onPressed: () {},
                    child: const Icon(Icons.remove),
                  ),
                  Container(
                    width: 190,
                    height: 120,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                              child: Text(widget.menuoption,
                                  style: TextStyle(
                                    fontSize: 21,
                                  )),
                              width: 100,
                              height: 50,
                              color: Colors.white),
                          Container(
                              child: Text(widget.priceoption,
                                  style: TextStyle(
                                    fontSize: 21,
                                  )),
                              width: 100,
                              height: 50,
                              color: Colors.white),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                child: Image.network(
                  widget.optionphoto,
                  fit: BoxFit.cover,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.blue),
                width: 90,
                height: 110,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
