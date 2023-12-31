class ServerConfiguration{

    static const domainNameServer='http://192.168.1.103:8000';
  static const login='/api/user/login';
  static const register='/api/user/register';
  static const logout ='/api/user/logout';
  static const getCategories ='/api/user/category/view';

  static String getMedicines(int id) {
    return '/api/admin/drug/get_detials/$id';
  }


}