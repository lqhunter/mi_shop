class BannerModel {
  List<BannerModelResult>? result;

  BannerModel({this.result});

  BannerModel.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <BannerModelResult>[];
      json['result'].forEach((v) {
        result!.add(BannerModelResult.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (result != null) {
      data['result'] = result!.map((v) => v.toJson()).toList();
    }
    return data;
  }


}

class BannerModelResult {
  String? sId;
  String? title;
  String? status;
  String? pic;
  String? url;
  int? position;

  BannerModelResult(
      {this.sId, this.title, this.status, this.pic, this.url, this.position});

  BannerModelResult.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    status = json['status'];
    pic = json['pic'];
    url = json['url'];
    position = json['position'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['status'] = this.status;
    data['pic'] = this.pic;
    data['url'] = this.url;
    data['position'] = this.position;
    return data;
  }
}
