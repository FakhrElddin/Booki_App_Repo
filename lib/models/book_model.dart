class BookModel{
  final String title;
  final int edition;
  final String category;
  final int timeUsed;
  final int price;
  final String status;
  final String bookOwnerName;
  final String bookOwnerId;
  final String bookOwnerImage;
  final String bookCoverImage;
  final String bookStubImage;
  final String bookPrintingImage;

  BookModel({
    required this.title,
    required this.edition,
    required this.category,
    required this.timeUsed,
    required this.price,
    required this.status,
    required this.bookOwnerName,
    required this.bookOwnerId,
    required this.bookOwnerImage,
    required this.bookCoverImage,
    required this.bookStubImage,
    required this.bookPrintingImage,
  });

}