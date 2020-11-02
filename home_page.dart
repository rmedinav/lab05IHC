import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  var num1 = 0, num2 = 0, num3=0, sum = 0;
  var largoname=0,largonamesinespacios=0;
  var urInte=0, tFun=0,tDia=0,acDia=0,caAnio=0;
  var name=' ';
TextEditingController _controlerName;
  final TextEditingController t1 = new TextEditingController(text: "");
  final TextEditingController t2 = new TextEditingController(text: "");
  final TextEditingController t3 = new TextEditingController(text: "");

@override
void initState(){
  _controlerName = TextEditingController();
  super.initState();
}

  void doCalcular(){
    setState(() {
      var temp=0;
      num1 = int.parse(t1.text);
      num2 = int.parse(t2.text);
      num3 = int.parse(t3.text);
      sum = sumarDigitos(num1)+sumarDigitos(num2)+sumarDigitos(num3);
      urInte= sumarDigitos(sum);
      name = _controlerName.text;
      largoname = name.characters.length;

     for(int i=0;i<largoname;i++){
        // ignore: unrelated_type_equality_checks
        if(name[i] ==' ')
        temp++;
      }
      largonamesinespacios=largoname-temp;
      tFun = sumarDigitos(largonamesinespacios);
      tDia = urInte + tFun;
      tDia = sumarDigitos(tDia);
      
      acDia = tDia;
      caAnio = urInte + urInte;
      caAnio = sumarDigitos(caAnio);

    });
  }
  int sumarDigitos(int num){
    if(num==0)
    return 0;
    else{
      return sumarDigitos(num~/10) + num%10;
    }
  }

  void doClear() {
    setState(() {
      t1.clear();
      t2.clear();
      t3.clear();
      _controlerName.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Estudio Numerológico"),
      ),
      body: new Container(
        padding: const EdgeInsets.all(40.0),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              "Ingrese sus datos",
              style: new TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.normal,
                  color: Colors.black),
            ),
            new Text(
              "Urgencia Interior : $urInte",
              style: new TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.normal,
                  color: Colors.black),
            ),
            new Text(
              "Tónica fundamental: $tFun",
              style: new TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.normal,
                  color: Colors.black),
            ),
            new Text(
              "Tónica del día: $tDia",
              style: new TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.normal,
                  color: Colors.black),
            ),
            new Text(
              "Acontecimiento del día: $acDia",
              style: new TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.normal,
                  color: Colors.black),
            ),
            new Text(
              "Cábala del año: $caAnio",
              style: new TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.normal,
                  color: Colors.black),
            ),
            SizedBox(height:10,),
            new TextField(
              keyboardType: TextInputType.text,
              decoration: new InputDecoration(labelText: "Nombre y Apellidos",
              border: OutlineInputBorder()),
              controller: _controlerName,
            ),
            SizedBox(height:10,),
            new TextField(
              keyboardType: TextInputType.number,
              decoration: new InputDecoration(labelText: "Dia de Nacimiento",
              border: OutlineInputBorder()),
              controller: t1,
            ),
            SizedBox(height:10,),
            new TextField(
              keyboardType: TextInputType.number,
              decoration: new InputDecoration(labelText: "Mes de Nacimiento",
              border: OutlineInputBorder()),
              controller: t2,
            ),
            SizedBox(height:10,),
            new TextField(
              keyboardType: TextInputType.number,
              decoration: new InputDecoration(labelText: "Año de Nacimiento",
              border: OutlineInputBorder()),
              controller: t3,
            ),
            new Padding(
              padding: const EdgeInsets.only(top: 20.0),
            ),
          new Padding(
              padding: const EdgeInsets.only(top: 20.0),
            ),

            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new MaterialButton(
                  child: new Text("Calcular"),
                  color: Colors.greenAccent,
                  onPressed: doCalcular,
                ),
              ],
            ),
 
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new MaterialButton(
                  child: new Text("Limpiar"),
                  color: Colors.greenAccent,
                  onPressed: doClear,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
