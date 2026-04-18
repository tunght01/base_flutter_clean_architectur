import 'package:flutter/material.dart';
import 'package:soft_dream_test/domain/entities/product_entity.dart';
import 'package:soft_dream_test/presentation/resource/styles/app_colors.dart';
import 'package:soft_dream_test/presentation/resource/styles/app_text_styles.dart';

class ProductActionDialogs {
  /// Hiển thị Dialog Xoá

  /// Hiển thị Bottom Sheet Nhập liệu Thêm / Sửa
  /// Trả về một Map chứa Data để đưa ra tầng Bloc tự gán Logic
  static Future<Map<String, dynamic>?> showProductForm(
    BuildContext context, {
    ProductEntity? initialProduct,
  }) {
    return showModalBottomSheet<Map<String, dynamic>>(
      context: context,
      isScrollControlled: true, // Cho phép kéo cao hơn
      backgroundColor: Colors.transparent,
      builder: (context) => _ProductFormSheet(initialProduct: initialProduct),
    );
  }
}

class _ProductFormSheet extends StatefulWidget {
  final ProductEntity? initialProduct;
  const _ProductFormSheet({this.initialProduct});

  @override
  State<_ProductFormSheet> createState() => _ProductFormSheetState();
}

class _ProductFormSheetState extends State<_ProductFormSheet> {
  late TextEditingController _nameCtrl;
  late TextEditingController _priceCtrl;
  late TextEditingController _descCtrl;
  bool _inStock = true;

  @override
  void initState() {
    super.initState();
    _nameCtrl = TextEditingController(text: widget.initialProduct?.name ?? '');
    _priceCtrl = TextEditingController(
      text: widget.initialProduct != null
          ? widget.initialProduct!.price.toStringAsFixed(0)
          : '',
    );
    _descCtrl = TextEditingController(
      text: widget.initialProduct?.description ?? '',
    );
    _inStock = widget.initialProduct?.inStock ?? true;
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    _priceCtrl.dispose();
    _descCtrl.dispose();
    super.dispose();
  }

  void _onSave() {
    // Gom dữ liệu ném ra ngoài không xử lý logic ở đây
    Navigator.of(context).pop({
      'name': _nameCtrl.text.trim(),
      'price': double.tryParse(_priceCtrl.text.trim()) ?? 0.0,
      'description': _descCtrl.text.trim(),
      'inStock': _inStock,
    });
  }

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;
    final isEdit = widget.initialProduct != null;

    return Container(
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 20,
        bottom: bottomInset > 0 ? bottomInset + 16 : 32,
      ),
      decoration: BoxDecoration(
        color: AppColors.current.backgroundPrimary ?? Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Handle bar
            Center(
              child: Container(
                width: 40,
                height: 5,
                decoration: BoxDecoration(
                  color: AppColors.current.border ?? Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              isEdit ? 'Chỉnh sửa Sản Phẩm' : 'Tạo mới Sản Phẩm',
              style: AppTextStyle.bold24(color: AppColors.current.textTitle),
            ),
            const SizedBox(height: 24),

            // Tên SP
            _buildInput(
              label: 'Tên Sản Phẩm',
              controller: _nameCtrl,
              hint: 'Nhập tên SP',
            ),
            const SizedBox(height: 16),

            // Giá
            _buildInput(
              label: 'Giá bán (đ)',
              controller: _priceCtrl,
              hint: 'Ví dụ: 150000',
              isNumber: true,
            ),
            const SizedBox(height: 16),

            // Mô tả
            _buildInput(
              label: 'Mô tả ngắn',
              controller: _descCtrl,
              hint: 'Thêm ít mô tả cho xịn...',
              maxLines: 3,
            ),
            const SizedBox(height: 20),

            // Trạng thái kho
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Tình trạng kho hàng',
                  style: AppTextStyle.semiBold16(
                    color: AppColors.current.textTitle,
                  ),
                ),
                Switch.adaptive(
                  value: _inStock,
                  activeColor: AppColors.current.primaryDefault ?? Colors.blue,
                  onChanged: (val) {
                    setState(() {
                      _inStock = val;
                    });
                  },
                ),
              ],
            ),
            Text(
              _inStock ? 'Hiển thị: Có Sẵn' : 'Hiển thị: Đã Hết Hàng',
              style: AppTextStyle.custom(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: _inStock ? Colors.green : Colors.red,
              ),
            ),
            const SizedBox(height: 32),

            // Nút Lưu
            SizedBox(
              width: double.infinity,
              height: 54,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      AppColors.current.primaryDefault ?? Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
                onPressed: _onSave,
                child: Text(
                  isEdit ? 'Lưu thay đổi' : 'Tạo Lập Đội Hình',
                  style: AppTextStyle.bold18(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInput({
    required String label,
    required TextEditingController controller,
    required String hint,
    int maxLines = 1,
    bool isNumber = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyle.semiBold14(color: AppColors.current.textTitle),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          maxLines: maxLines,
          keyboardType: isNumber ? TextInputType.number : TextInputType.text,
          style: AppTextStyle.custom(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppColors.current.textTitle,
          ),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: AppTextStyle.custom(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.current.textDisable,
            ),
            filled: true,
            fillColor: (AppColors.current.border ?? Colors.grey.shade200)
                .withOpacity(0.5),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: AppColors.current.primaryDefault ?? Colors.blue,
                width: 1.5,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
