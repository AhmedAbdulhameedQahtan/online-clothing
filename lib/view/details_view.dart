import 'package:flutter/material.dart';
import 'package:online_clothing/resources/values_manager.dart';
import '../resources/color_manager.dart';
import '../resources/font_manager.dart';

class DetailsView extends StatefulWidget {

  Map<String,dynamic> product;

  DetailsView({super.key,required this.product});

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  get product => widget.product;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
          width: size.width,
          height: size.height,
          child: Stack(
            children: [
              Container(
                  height: size.height / AppSize.s2_1,
                  width: size.width,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                  ),
                  child: Center(
                    child: Image.network(
                      product['image']!,
                      width: AppSize.s300,
                      height:  AppSize.s300,
                    ),
                  )),
              Padding(
                padding:const EdgeInsets.only(top: AppPadding.p20),
                child: IconButton(
                    onPressed: (){
                      Navigator.pop(context);
                    }, icon: const Icon(Icons.arrow_back,size: AppSize.s40,)),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  height: size.height - (size.height / AppSize.s2_3),
                  width: size.width,
                  margin:  const EdgeInsets.only(top: AppMargin.m50),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(topRight:  Radius.circular(AppSize.s30),topLeft:  Radius.circular(AppSize.s30)),
                    color: Theme.of(context).colorScheme.onSurface,
                  ),

                  child:Stack(
                    children: [
                      Container(
                        // color: ColorsManager.lightBlue,
                        margin: const EdgeInsets.all(AppMargin.m10),
                        width: size.width,
                        height: size.height/AppSize.s2_1,
                        child: ListView(
                          children: [
                            // cloth name and rate
                            Padding(
                              padding: const EdgeInsets.only(left: AppPadding.p5,right: AppPadding.p5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(left: AppPadding.p5,right: AppPadding.p5),
                                    width: size.width/AppSize.s1_46,
                                    child: Text(product?['title'],
                                      style:Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: FontSize.s20),
                                      maxLines: 3, // يحدد عدد الأسطر التي يمكن عرضها
                                      softWrap: true, // يسمح بالنزول إلى سطر جديد
                                      // overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Container(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        IconButton(
                                            onPressed: (){},
                                            icon:const Icon(Icons.star ,color: Colors.yellow,)
                                        ),
                                        Text("(${product['rating']['rate']})",style: Theme.of(context).textTheme.titleSmall,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            // details text
                            Padding(
                              padding: const EdgeInsets.only(top: AppPadding.p15,left: AppPadding.p15,right: AppPadding.p15),
                              child: Text(product['description'],
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                            ),


                          ],
                        ) ,
                      ),

                      // buy botton
                      Positioned(
                        bottom: 0,
                          child: Container(
                            width: size.width,
                            height: size.height/AppSize.s9,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                // price text
                                Container(
                                  padding:const  EdgeInsets.only(top:AppPadding.p25),
                                  child:  Column(
                                    children: [
                                      Text("price",style: Theme.of(context).textTheme.titleSmall,
                                      ),
                                      Text("\$${product['price']}",style: Theme.of(context).textTheme.titleSmall,
                                      ),
                                    ],
                                  ),
                                ),

                                // elevation button to buy
                                Container(
                                  width: size.width /AppSize.s1_5,
                                  padding:const  EdgeInsets.only(top:AppPadding.p15),

                                  child: ElevatedButton(
                                    onPressed: (){
                                      // Navigator.push(context, MaterialPageRoute(builder: (context)=>WalletView()));

                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: ColorsManager.primary,
                                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10), // التحكم في المسافات الداخلية (حجم الزر)
                                      shape: RoundedRectangleBorder( // شكل الزر (حواف مستديرة)
                                        borderRadius: BorderRadius.circular(AppSize.s20), // تحديد نصف قطر الزوايا
                                      ),
                                    ),
                                    child:   Text('Buy now',style: TextStyle(color:ColorsManager.white,fontWeight: FontWeighManager.bold),),

                                  ),
                                ),

                              ],
                            ),
                          )
                      ),
                    ],
                  )

                ),
              ),
            ],
          ),
        )
    );
  }
}
