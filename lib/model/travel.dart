class Travel {
  final String name;
  final String descrpition;
  final int duration;
  final String location;
  final double rating;
  final int distans;
  final double cost;
  final List<String> imageUrl;

  Travel(this.name, this.duration, this.descrpition,  this.location, this.rating, this.distans,  this.imageUrl, this.cost);
  static List<Travel> getTravelItem() {
    final List<Travel> _travelList = [
     Travel("Magic Travel", 4, "The building where the heights meets the golden touches", "Cairo Egypt", 4.6, 3, ["assets/images/egypt.jpg"], 230),
      Travel("Magic Travel", 4, "The building where the heights meets the golden touches", "Cairo Egypt", 4.6, 3, ["assets/images/egypt.jpg"], 230),
      Travel("Magic Travel", 4, "The building where the heights meets the golden touches", "Cairo Egypt", 4.6, 3, ["assets/images/egypt.jpg"], 230),
      Travel("Magic Travel", 4, "The building where the heights meets the golden touches", "Cairo Egypt", 4.6, 3, ["assets/images/egypt.jpg"], 230),
      Travel("Magic Travel", 4, "The building where the heights meets the golden touches", "Cairo Egypt", 4.6, 3, ["assets/images/egypt.jpg"], 230),

    ];
    return _travelList;
 }


 static List<Travel> getNearestItem() {
    List<Travel> _travelList = Travel.getTravelItem();
    return _travelList.where((element) => element.distans < 10).toList();
  }
}