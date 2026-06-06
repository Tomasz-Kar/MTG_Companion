class MtgCardFilters {
  String name;
  String type;
  String rarity;
  String set;

  MtgCardFilters({
    this.name = '',
    this.type = '',
    this.rarity = '',
    this.set = '',
  });

  void clear() {
    name = '';
    type = '';
    rarity = '';
    set = '';
  }

  bool empty() {
    if (name == '' && type == '' && rarity == '' && set == '') {
      return true;
    }
    return false;
  }
}
