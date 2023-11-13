import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shopping_dsu/constants.dart';
import '../../../models/Product.dart';
import '../../../size_config.dart';
import '../../details/detail_veg_itemcheck.dart';

class ItemListPage extends StatefulWidget {
  const ItemListPage({super.key});

  @override
  State<ItemListPage> createState() => _ItemListPageState();
}

class _ItemListPageState extends State<ItemListPage> {
  final NumberFormat numberFormat = NumberFormat('###,###,###,###');
  List<Product> productList = [
    Product(
        images: ["assets/images/potato_1.jpg"],
        title: "강원도 못난이 감자",
        price: 5000,
        description: '강원도에서 나고 자란 못난이 감자'),
    Product(
        images: ["assets/images/corn_1.jpg"],
        title: "강원도 못난이 옥수수",
        price: 7000,
        description: '강원도에서 나고 자란 못난이 옥수수'),
    Product(
        images: ["assets/images/strawberry_1.jpg"],
        title: "논산 못난이 딸기",
        price: 8000,
        description: '논산에서 나고 자란 못난이 딸기'),
    Product(
        images: ["assets/images/honey_1.jpg"],
        title: "지리산 천연 벌꿀",
        price: 10000,
        description: '지리산 청정 구역에서 꿀벌들이 모은 천연 꿀'),
    Product(
        images: ["assets/images/carrot1.jpg"],
        title: "제주 못난이 당근",
        price: 5000,
        description: '제주도에서 나고 자란 못난이 당근'),
    Product(
        images: ["assets/images/papu.jpg"],
        title: "전남 못난이 파프리카",
        price: 8000,
        description: '농부들이 한 땀 한 땀 키운 못난이 파프리카'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text("채소 리스트"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        titleTextStyle: const TextStyle(
            fontFamily: 'pretendard',
            fontWeight: FontWeight.w700,
            color: Color.fromARGB(255, 143, 143, 143),
            fontSize: 20),
        iconTheme: const IconThemeData(
          color: Color.fromARGB(255, 143, 143, 143),
        ),
      ),
      body: GridView.builder(
        itemCount: productList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 0.9,
          crossAxisCount: 2,
          // mainAxisExtent: 250,
        ),
        itemBuilder: (context, index) {
          return productContainer(
              productName: productList[index].title,
              productImageUrl: productList[index].images.firstOrNull ?? "",
              // 첫번째 요소를 가져옴
              description: productList[index].description,
              price: productList[index].price);
        },
      ),
    );
  }

  Widget productContainer(
      {required String productName,
      required String productImageUrl,
      required String description,
      required double price}) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            return ItemDetailsPage(
                productName: productName,
                productImageUrl: productImageUrl,
                description: description,
                price: price);
          },
        ));
      },
      child: Container(
        margin:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(productImageUrl, fit: BoxFit.cover),
              Container(
                padding: const EdgeInsets.all(3),
                child: Text(productName,
                    style: const TextStyle(
                      fontFamily: 'pretendard',
                      fontWeight: FontWeight.w600,
                    )),
              ),
              Container(
                padding: const EdgeInsets.all(2),
                child: Text(
                  "${numberFormat.format(price)}원",
                  style: const TextStyle(
                      fontFamily: 'pretendard',
                      fontWeight: FontWeight.w400,
                      color: kPrimaryColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
