import 'package:flutter/material.dart';
import 'package:sa_cooperation/utils/icon_util.dart';
import 'package:sa_cooperation/utils/style.dart';

class InformationScreen extends StatefulWidget {
  const InformationScreen({Key? key}) : super(key: key);

  @override
  State<InformationScreen> createState() => _InformationScreenState();
}

class _InformationScreenState extends State<InformationScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Style.pColor,
        title: const Text(
          "Happiness",
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
          ),
        ),
        centerTitle: false,
        leading: IconButton(
          onPressed: () {},
          icon: Image.asset(
            menuIcon,
            height: 25,
          ),
        ),
      ),
      body: Container(
        width: width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            tileMode: TileMode.clamp,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(252, 129, 48, 1),
              Colors.white,
            ],
          ),
        ),
        child: Center(
          child: Container(
            height: height * 0.55,
            width: width * 0.85,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Positioned(
                  bottom: 0,
                  child: Container(
                    padding: EdgeInsets.all(25),
                    height: height * 0.48,
                    width: width * 0.82,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: const LinearGradient(
                        tileMode: TileMode.clamp,
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color.fromRGBO(211, 211, 246, 0.9),
                          Colors.white,
                        ],
                      ),
                      border: Border.all(
                        width: 10,
                        color: Colors.white,
                      ),
                    ),
                    child: Column(
                      children: [
                        const Text(
                          "Success Index",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        const Text(
                          "Success Index  kahoiwucbsbljbfvoiwbbicbajkhfuarnfruncurhyrjalvkbalfvajfva lafbvalkfvboibv ahfbvas vlhbfv alknakuf nlakj lkab aknkjdnajhurakjnrrnt hi nme is swone of the most impotan asesrts",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        const Spacer(),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Skip",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 5,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Style.pColor,
                    ),
                    height: height * 0.1,
                    child: Image.asset(infoWhiteIcon),
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
