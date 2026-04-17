# Soft Dream Test (Flutter)

Dự án Flutter này được xây dựng dựa trên mô hình **Clean Architecture 3 Lớp**. 
Mục tiêu là code gọn gàng, chia việc rõ ràng, dễ bảo trì và đặc biệt là người mới vào cũng có thể hiểu được dòng chảy của dữ liệu.

Dưới đây là sơ đồ và giải thích siêu dễ hiểu cho những bạn mới tiếp cận.

---

## 🏗 Kiến Trúc Clean Architecture

Tưởng tượng ứng dụng của chúng ta giống như một **Nhà hàng**. Nhà hàng này được chia làm 3 khu vực tách biệt hoàn toàn (để nhân viên khu vực này không lấn sang làm việc của khu vực khác).

### 1. Tầng Domain (Não bộ / Quản lý)
Thư mục: `lib/domain/`

Đây là **phần cốt lõi và quan trọng nhất** của ứng dụng. 
Ở tầng này, chúng ta định nghĩa các quy tắc nghiệp vụ. Tầng này **TUYỆT ĐỐI KHÔNG** biết ứng dụng đang dùng Firebase, SQLite hay giao diện màu gì. Nó chỉ biết logic mà thôi.

Bao gồm:
- **Entities:** Các đối tượng chính của app (ví dụ: `AccountInfo`, `CreateUserRequest`). Giống như công thức nấu ăn chuẩn mực của nhà hàng.
- **UseCase:** Tập hợp các hành động cụ thể mà người dùng có thể làm (ví dụ: `SignUpUseCase`, `SaveUserProfileUseCase`).
- **Repository (Interface):** Các Hợp đồng - Quy định rằng "Tôi cần một hàm để Lấy tài khoản", nhưng không quan tâm hàm đó đi lấy từ Firebase hay API nào.

### 2. Tầng Data (Kho chứa / Đầu bếp)
Thư mục: `lib/data/`

Nhiệm vụ của tầng này là đi lấy dữ liệu thô từ Internet (API) hoặc Database (Firebase), sau đó chế biến lại thành dạng "chuẩn" để ném lên cho tầng Domain sử dụng.

Bao gồm:
- **Data Source:** Thao tác trực tiếp với Firebase, Dio (Gọi API HTTP),...
- **Models:** Dữ liệu thô từ mạng trả về, có thêm các hàm `fromJson`, `toJson` để dịch dữ liệu.
- **Repository (Implementation):** Những người thợ đi "thực thi" cái hợp đồng mà tầng Domain đưa ra. Ví dụ: Domain yêu cầu "Lấy thông tin tài khoản", thì tầng Data sẽ viết logic chạy vào Firebase lấy đúng data đó ra.

### 3. Tầng Presentation (Giao diện / Khách quen)
Thư mục: `lib/presentation/`

Đây là bộ mặt của ứng dụng, là thứ mà người dùng sẽ bấm và nhìn thấy trên màn hình. Tầng này chỉ được phép giao tiếp với tầng Domain để xin data hiển thị, chứ không được phép gọi thẳng xuống tầng Data hay Firebase.

Bao gồm:
- **Pages / UI:** Các màn hình (Login, SignUp, Home) và các Widget (Nút bấm, Ô nhập chữ).
- **BLoC / Cubit:** Bộ rễ quản lý trạng thái. BLoC sẽ lắng nghe "Sự kiện" khách bấm nút, sau đó nhờ **UseCase** (ở Domain) xử lý dữ liệu rồi trả kết quả về lên Màn hình.

---

## 🚦 Luồng chạy (Ví dụ quá trình Đăng ký)
Luồng chạy qua 3 bước như sau:
1. **(Presentation)** Người dùng nhấn nút "Đăng Ký" trên màn hình. `SignUpBloc` bắt được sự kiện này và gọi `SignUpUseCase`.
2. **(Domain)** `SignUpUseCase` nói rằng: "Cần lưu dữ liệu user này!". Nó đẩy yêu cầu xuống cho `StoreRepository`.
3. **(Data)** Tầng Data thấy yêu cầu từ Hợp đồng Repository, lập tức chạy hàm kết nối gọi lên `Firebase` để lưu dữ liệu. Thành công thì báo ngược lại lên trên để Màn hình nhảy thông báo "Thành công!".

---

## 🚀 Thiết lập & Khởi chạy (Dành cho Dev)

Bạn cần chạy các lệnh sau để đảm bảo dự án tự động sinh ra các đoạn code cần thiết:

```bash
# 1. Tải cẩn thận các thư viện
flutter pub get

# 2. Chạy lệnh sinh code ngôn ngữ (i18n)
fvm dart run intl_utils:generate 

# 3. Chạy lệnh sinh code kiến trúc DI (dependency injection)
fvm flutter pub run build_runner build --delete-conflicting-outputs
```