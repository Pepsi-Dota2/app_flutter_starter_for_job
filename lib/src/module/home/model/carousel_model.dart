import 'package:freezed_annotation/freezed_annotation.dart';

part 'carousel_model.freezed.dart';
part 'carousel_model.g.dart';

@freezed
class CarouselModel with _$CarouselModel{
  const factory CarouselModel({
    @Default("") String title,
    @Default("") String description,
    @Default("") String imageUrl,
  }) = _CarouselModel;

  factory  CarouselModel.fromJson(Map<String , dynamic> json) => _$CarouselModelFromJson(json);
   static final  List<CarouselModel> items = [
      CarouselModel(
        imageUrl:
            'https://www.thedotstore.com/wp-content/uploads/sites/1417/2023/11/image-17.jpeg',
        title: 'Image 1',
        description: 'This is the description for Image 1.',
      ),
      CarouselModel(
        imageUrl:
            'https://images.unsplash.com/photo-1523275335684-37898b6baf30?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZHVjdHxlbnwwfHwwfHx8MA%3D%3D',
        title: 'Image 2',
        description: 'This is the description for Image 2.',
      ),
      CarouselModel(
        imageUrl:
            'https://help.rangeme.com/hc/article_attachments/360006928633/what_makes_a_good_product_image.jpg',
        title: 'Image 3',
        description: 'This is the description for Image 3.',
      ),
    ];

}