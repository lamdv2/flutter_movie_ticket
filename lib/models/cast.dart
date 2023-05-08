import '../utils/helper.dart';

class Cast{
  String nameCast;
  String profileImgCast;

  Cast(this.nameCast, this.profileImgCast);
}

final List<Cast> listCasters = [
  Cast('John C. Reilly', AssetHelper.imgCastSara),
  Cast('Sarah Silverman', AssetHelper.imgCastJohn),
  Cast('Jack McBrayer', AssetHelper.imgCastJack),
  Cast('Taraji P. Henson', AssetHelper.imgCastTara),
  Cast('LamBo Gun', AssetHelper.imgCastJohn),
  Cast('DoVanLam Bi', AssetHelper.imgCastJack),
];
