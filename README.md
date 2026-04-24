# Soft Dream Test (Flutter)

Dự án Flutter này được xây dựng dựa trên mô hình **Clean Architecture 3 Lớp**. 
Mục tiêu là code gọn gàng, chia việc rõ ràng, dễ bảo trì và đặc biệt là người mới vào cũng có thể hiểu được dòng chảy của dữ liệu.

Dưới đây là sơ đồ và giải thích siêu dễ hiểu cho những bạn mới tiếp cận.

Tích hợp Shorebird để code push
---
Source tham khảo base Hive : https://github.com/MohanedZekry/flutter-local-storage-clean-architecture/blob/master/lib/tasks/data/data_sources/local/hive/tasks.dart#L4C1-L19C2
Source code tham khảo clean architecture : https://github.com/ntminhdn/Flutter-Bloc-CleanArchitecture

## 🚀 Thiết lập & Khởi chạy (Dành cho Dev)

Bạn cần chạy các lệnh sau để đảm bảo dự án tự động sinh ra các đoạn code cần thiết:

## Flutter: 3.38.5

```bash
# 1. Tải cẩn thận các thư viện

flutter pub get

# 2. Chạy lệnh sinh code ngôn ngữ (i18n)
dart run intl_utils:generate 

# 3. Chạy lệnh sinh code kiến trúc DI (dependency injection)
flutter pub run build_runner build --delete-conflicting-outputs
```