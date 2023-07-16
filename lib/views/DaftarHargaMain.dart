import 'package:flutter/material.dart';
import '../data/dummyDaftarHarga.dart';

class DaftarHarga1 extends StatefulWidget {
  @override
  _DaftarHarga1State createState() => _DaftarHarga1State();
}

class _DaftarHarga1State extends State<DaftarHarga1> {
  final int itemsPerPage = 8;
  int currentPage = 1;

  List<PriceItem> getVisibleItems() {
    final int startIndex = (currentPage - 1) * itemsPerPage;
    final int endIndex = startIndex + itemsPerPage;
    final int lastIndex = priceItems.length - 1;

    if (endIndex <= lastIndex) {
      return priceItems.sublist(startIndex, endIndex);
    } else {
      return priceItems.sublist(startIndex, lastIndex + 1);
    }
  }

  void nextPage() {
    setState(() {
      currentPage++;
    });
  }

  void previousPage() {
    setState(() {
      currentPage = currentPage > 1 ? currentPage - 1 : 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<PriceItem> visibleItems = getVisibleItems();

    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Harga'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: visibleItems.length,
              itemBuilder: (context, index) {
                final priceItem = visibleItems[index];
                return Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 150,
                        child: Card(
                          elevation: 30,
                          color: Colors.grey[100],
                          child: Padding(
                            padding: const EdgeInsets.only(top: 35),
                            child: ListTile(
                              leading: Padding(
                                padding: const EdgeInsets.only(bottom: 15),
                                child: Image.asset(
                                  priceItem.image,
                                  width: 80,
                                  height: 80,
                                ),
                              ),
                              title: Text(
                                priceItem.title,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 20),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    priceItem.deskripsi,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    priceItem.price,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 20),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Visibility(
                  visible: currentPage != 1,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: previousPage,
                  ),
                ),
                SizedBox(width: 8),
                for (int page = 1;
                    page <= (priceItems.length / itemsPerPage).ceil();
                    page++)
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        currentPage = page;
                      });
                    },
                    child: Text(page.toString()),
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          currentPage == page ? Colors.green : Colors.grey,
                    ),
                  ),
                Visibility(
                  visible:
                      currentPage != (priceItems.length / itemsPerPage).ceil(),
                  child: IconButton(
                    icon: Icon(Icons.arrow_forward),
                    onPressed: nextPage,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
