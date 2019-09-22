

class GoogleUser{
  String providerDetails;
  String userName;
  String photoUrl;
  String userEmail;
  List<ProviderDetails> providerData;

  GoogleUser(this.providerDetails, this.userName, this.photoUrl, this.userEmail,
      this.providerData);


  GoogleUser.fromJson(Map json)
      :providerDetails = json['providerDetails'],
        userName = json['userName'],
        photoUrl = json['photoUrl'],
        userEmail = json['userEmail'],
        providerData = json['providerData'];


}

class ProviderDetails{
  ProviderDetails(this.providerDetails);
  final String providerDetails;
}