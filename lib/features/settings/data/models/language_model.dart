class LanguageModel{
  final int id;
  final String name;
  final String code;
  final String flag;
 const LanguageModel({required this.id,required this.name,required this.code,required this.flag});
 static List<LanguageModel> languages= const[
   LanguageModel(id: 1, name: "English", code: "en", flag: "🇬🇧"),
   LanguageModel(id: 2, name: "العربية", code: "ar", flag: "🇸🇦"),
 ];
}