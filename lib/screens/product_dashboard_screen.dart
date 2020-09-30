import 'dart:io';
import 'package:ecommerceapp/model/product.dart';
import 'package:ecommerceapp/provider/homeProvider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class ProductDashBoardScreen extends StatefulWidget {
  static const route = 'product_dashboard_screen';
  @override
  _ProductDashBoardScreenState createState() => _ProductDashBoardScreenState();
}

class _ProductDashBoardScreenState extends State<ProductDashBoardScreen> {
  final _form = GlobalKey<FormState>();
  File _file;
  final picker = ImagePicker();

  List<DropdownMenuItem> dropdownMenuItem = List();
  TextEditingController _titleControler;
  TextEditingController _priceControler;
  TextEditingController _stockQuantityControler;
  TextEditingController _descriptionControler;
  TextEditingController _imageControler;

  final _priceFoucsNode = FocusNode();
  final _descriptionFoucsNode = FocusNode();
  final _quantityFoucsNode = FocusNode();
  var valueProperty;
  String image;
  var productDate = Product(
    id: null,
    title: '',
    description: '',
    price: 0,
    quantity: 0,
    stockQuantity: 0,
    imageUrl: '',
    isFavorite: false,
    category: '',
    file: null,
  );

  var _isInit = true;
  // var _initialProductvalue = {
  //   "title": "",
  //   "description": "",
  //   "price": "",
  //   "stocQuantity": "",
  //   "category": "",
  //   "file": "",
  // };

  @override
  void initState() {
    _titleControler = TextEditingController();
    _priceControler = TextEditingController();
    _stockQuantityControler = TextEditingController();
    _descriptionControler = TextEditingController();
    _imageControler = TextEditingController();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      final productId = ModalRoute.of(context).settings.arguments as String;
      if (productId != null) {
        productDate = Provider.of<HomeProvider>(context, listen: false)
            .findById(productId);
        _titleControler.text = productDate.title;
        _descriptionControler.text = productDate.description;
        _stockQuantityControler.text = productDate.stockQuantity.toString();
        _priceControler.text = productDate.price.toString();
        valueProperty = productDate.category;
        _file = productDate.file;
        image = productDate.imageUrl;
        _imageControler.text = productDate.imageUrl;
      }
    }
    _isInit = false;

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _titleControler.dispose();
    _priceControler.dispose();
    _stockQuantityControler.dispose();
    _descriptionControler.dispose();
    _imageControler.dispose();
    _priceFoucsNode.dispose();
    _descriptionFoucsNode.dispose();
    _quantityFoucsNode.dispose();
    super.dispose();
  }

  void _saveForm() async {
    bool _isValidate = _form.currentState.validate();
    if (!_isValidate) {
      return;
    }
    _form.currentState.save();
    if (productDate.id != null) {
      Provider.of<HomeProvider>(context, listen: false)
          .updataProduct(id: productDate.id, editProduct: productDate);
      Navigator.of(context).pop();
    } else {
      try {
        Provider.of<HomeProvider>(context, listen: false).addProduct1(
          // id: productDate.id,
          title: productDate.title,
          description: _descriptionControler.text,
          file: _file,
          image: productDate.imageUrl ?? "",
          price: productDate.price,
          quantity: 1,
          stockQuantity: productDate.stockQuantity,
          category: productDate.category,
        );
        Navigator.of(context).pop();
      } catch (error) {
        return showDialog(
            context: context,
            child: AlertDialog(
              title: Text('Error'),
              content: Text(error),
              actions: [
                FlatButton(
                  child: Text('Ok'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            ));
      }
    }
  }

  Future<void> _showUploadDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text("from where do you want to take the photo?"),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    GestureDetector(
                      child: Text('Gallery'),
                      onTap: () async {
                        final file =
                            await picker.getImage(source: ImageSource.gallery);
                        setState(() {
                          _file = File(file.path);
                          productDate.imageUrl = _file.toString();
                          productDate.file = _file;
                        });
                        Navigator.of(context).pop();
                      },
                    ),
                    Padding(padding: EdgeInsets.all(8.0)),
                    GestureDetector(
                      child: Text('Camera'),
                      onTap: () async {
                        final file =
                            await picker.getImage(source: ImageSource.camera);
                        setState(() {
                          _file = File(file.path);
                          productDate.imageUrl = _file.toString();
                          productDate.file = _file;
                        });
                        Navigator.of(context).pop();
                      },
                    )
                  ],
                ),
              ));
        });
  }

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Product DashBoard'),
        actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                _saveForm();
              })
        ],
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: _form,
          child: Column(
            children: [
              // Image Picker
              Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width,
                  child: Card(
                      shape: Border.all(
                          // color: colorImage ? Colors.red : Colors.black,
                          color: Colors.redAccent.withOpacity(0.6),
                          width: 2),
                      child: _file == null
                          ? RaisedButton.icon(
                              icon: Icon(Icons.file_upload),
                              label: Text(
                                "Upload ",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 25),
                              ),
                              onPressed: () async {
                                _showUploadDialog(context);
                              })
                          : Container(
                              decoration:
                                  new BoxDecoration(color: Colors.white),
                              height: MediaQuery.of(context).size.height * 0.3,
                              width: MediaQuery.of(context).size.width,
                              child: Stack(
                                children: <Widget>[
                                  _imageControler.text.isEmpty
                                      ? Image.file(
                                          _file,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          fit: BoxFit.cover,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.3,
                                          // fit: BoxFit.contain,
                                        )
                                      : Image.network(
                                          image,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          fit: BoxFit.cover,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.3,
                                        ),
                                  Positioned(
                                    top: 5,
                                    right:
                                        5, //give the values according to your requirement
                                    child: Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          color: Colors.grey[500],
                                          border: Border.all(
                                              color: Colors.redAccent
                                                  .withOpacity(0.4))),
                                      child: IconButton(
                                          icon: Icon(
                                            Icons.close,
                                            size: 25,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              _file = null;
                                            });
                                          }),
                                    ),
                                  ),
                                ],
                              )))),

              // TextFormField(
              //   controller: _imageControler,
              //   decoration:
              //       InputDecoration(labelText: 'image', hintText: 'image'),
              //   textInputAction: TextInputAction.next,
              //   keyboardType: TextInputType.name,
              //   validator: (value) {
              //     if (value.isEmpty) {
              //       return 'Please enter the image plz...';
              //     } else if (value.length < 2) {
              //       return 'Please enter the long i,age plz...';
              //     }
              //     return null;
              //   },
              //   // onFieldSubmitted: (_) {
              //   //   FocusScope.of(context).requestFocus(_priceFoucsNode);
              //   // },
              //   onSaved: (value) {
              //     productDate = Product(
              //       id: productDate.id,
              //       title: productDate.title,
              //       description: productDate.description,
              //       price: productDate.price,
              //       quantity: productDate.quantity,
              //       imageUrl: value,
              //       isFavorite: productDate.isFavorite,
              //       category: productDate.category,
              //     );
              //   },
              // ),

              //Category TextField
              Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  child: DropdownButtonHideUnderline(
                      child: DropdownButtonFormField(
                    // items: itemsConvert(homeProvider.categories),
                    items: homeProvider.categories
                        .map((category) => DropdownMenuItem(
                              value: category,
                              child: Text(category),
                            ))
                        .toList(),

                    isExpanded: true,
                    decoration: InputDecoration(
                        labelText: 'Category', hintText: 'Category'),
                    value: valueProperty,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'This Field is Required';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        valueProperty = value;
                      });
                    },

                    onSaved: (value) {
                      productDate = Product(
                        id: productDate.id,
                        title: productDate.title,
                        description: productDate.description,
                        price: productDate.price,
                        quantity: productDate.quantity,
                        stockQuantity: productDate.stockQuantity,
                        imageUrl: productDate.imageUrl,
                        isFavorite: productDate.isFavorite,
                        category: value,
                        file: _file,
                      );
                    },
                  ))),

              // Title TextField
              TextFormField(
                controller: _titleControler,
                decoration:
                    InputDecoration(labelText: 'Title', hintText: 'title'),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.name,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter the title plz...';
                  } else if (value.length < 2) {
                    return 'Please enter the long title plz...';
                  }
                  return null;
                },
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_priceFoucsNode);
                },
                onSaved: (value) {
                  productDate = Product(
                    id: productDate.id,
                    title: value,
                    description: productDate.description,
                    price: productDate.price,
                    quantity: productDate.quantity,
                    stockQuantity: productDate.stockQuantity,
                    imageUrl: _file.toString(),
                    isFavorite: productDate.isFavorite,
                    category: productDate.category,
                    file: _file,
                  );
                },
              ),

              // Price TextField
              TextFormField(
                controller: _priceControler,
                decoration:
                    InputDecoration(labelText: 'Price', hintText: 'price'),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.numberWithOptions(),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter the price plz...';
                  } else if (value.length < 0) {
                    return 'Invalid Price';
                  }
                  return null;
                },
                focusNode: _priceFoucsNode,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_quantityFoucsNode);
                },
                onSaved: (value) {
                  productDate = Product(
                    id: productDate.id,
                    title: productDate.title,
                    description: productDate.description,
                    price: double.parse(value),
                    quantity: productDate.quantity,
                    stockQuantity: productDate.stockQuantity,
                    imageUrl: productDate.imageUrl,
                    isFavorite: productDate.isFavorite,
                    category: productDate.category,
                    file: _file,
                  );
                },
              ),

              // Quantity TextField
              TextFormField(
                controller: _stockQuantityControler,
                decoration: InputDecoration(
                    labelText: 'Stock Quantity', hintText: 'quantity'),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.numberWithOptions(),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter the quantity plz...';
                  } else if (value.length < 0) {
                    return 'Invalid Quantity';
                  }
                  return null;
                },
                focusNode: _quantityFoucsNode,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_descriptionFoucsNode);
                },
                onSaved: (value) {
                  productDate = Product(
                    id: productDate.id,
                    title: productDate.title,
                    description: productDate.description,
                    price: productDate.price,
                    quantity: productDate.quantity,
                    stockQuantity: int.parse(value),
                    imageUrl: productDate.imageUrl,
                    isFavorite: productDate.isFavorite,
                    category: productDate.category,
                    file: _file,
                  );
                },
              ),

              // Description TextField
              TextFormField(
                controller: _descriptionControler,
                decoration: InputDecoration(
                    labelText: 'Description', hintText: 'description'),
                maxLines: 3,
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.multiline,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter the description plz...';
                  } else if (value.length < 0) {
                    return 'Invalid Description';
                  } else if (value.length < 10) {
                    return 'Short Description';
                  }
                  return null;
                },
                focusNode: _descriptionFoucsNode,
                onSaved: (value) {
                  productDate = Product(
                    id: productDate.id,
                    title: productDate.title,
                    description: value,
                    price: productDate.price,
                    quantity: productDate.quantity,
                    stockQuantity: productDate.stockQuantity,
                    imageUrl: productDate.imageUrl,
                    isFavorite: productDate.isFavorite,
                    category: productDate.category,
                    file: _file,
                  );
                },
              ),
              SizedBox(height: 15),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: RaisedButton.icon(
                  icon: Icon(Icons.add),
                  label: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      'Submit',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  color: Colors.grey.withOpacity(0.6),
                  highlightColor: Colors.black.withOpacity(0.4),
                  onPressed: () {
                    _saveForm();

                    // _form.currentState.validate();
                    // _form.currentState.save();
                    // homeProvider.addProduct1(
                    //   // id: productDate.id,
                    //   title: productDate.title,
                    //   description: _descriptionControler.text,
                    //   file: _file,
                    //   image: productDate.imageUrl ?? "",
                    //   price: productDate.price,
                    //   quantity: 1,
                    //   stockQuantity: productDate.stockQuantity,
                    //   category: productDate.category,
                    // );
                    // Navigator.of(context).pop();

                    print('4444444444444444444444444444444444444444');
                    print(productDate.id);
                    print(productDate.title);
                    print(productDate.imageUrl);
                    print(productDate.category);
                    print(productDate.description);
                    print(productDate.quantity);
                    print(productDate.price);
                    print(productDate.isFavorite);
                    print(productDate.file);
                  },
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
