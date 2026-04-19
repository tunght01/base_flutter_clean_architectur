import 'package:flutter/material.dart';
import 'package:soft_dream_test/domain/entities/product_entity.dart';
import 'package:soft_dream_test/presentation/common_view/button/app_button.dart';
import 'package:soft_dream_test/presentation/common_view/spacing/spacing_const.dart';
import 'package:soft_dream_test/presentation/common_view/text_field/app_text_form_field.dart';
import 'package:soft_dream_test/presentation/resource/generated/l10n.dart';
import 'package:soft_dream_test/presentation/resource/styles/app_colors.dart';
import 'package:soft_dream_test/presentation/resource/styles/app_text_styles.dart';
import 'package:soft_dream_test/presentation/utils/validator_utils.dart';
import 'package:soft_dream_test/shared/utils/date_time_utils.dart';

class ProductFormSheet extends StatefulWidget {
  final ProductEntity? initialProduct;
  const ProductFormSheet({super.key, this.initialProduct});

  @override
  State<ProductFormSheet> createState() => _ProductFormSheetState();
}

class _ProductFormSheetState extends State<ProductFormSheet>
    with ValidatorUtils {
  late TextEditingController _nameCtrl;
  late TextEditingController _priceCtrl;
  late TextEditingController _descCtrl;
  late final GlobalKey<FormState> _signUpFormKey;

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
    _signUpFormKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    _priceCtrl.dispose();
    _descCtrl.dispose();
    super.dispose();
  }

  void _onSave() {
    if (_signUpFormKey.currentState?.validate() ?? false) {
      Navigator.of(context).pop(
        ProductEntity(
          id: widget.initialProduct?.id,
          updatedAt: DateTimeUtils.normalDateFormat.format(DateTime.now()),
          createdAt:
              widget.initialProduct?.createdAt ??
              DateTimeUtils.normalDateFormat.format(DateTime.now()),
          name: _nameCtrl.text.trim(),
          price: double.tryParse(_priceCtrl.text.trim()) ?? 0.0,
          description: _descCtrl.text.trim(),
          inStock: _inStock,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEdit = widget.initialProduct != null;

    return Container(
      decoration: BoxDecoration(
        color: AppColors.current.backgroundPrimary,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: SingleChildScrollView(
        child: Form(
          key: _signUpFormKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                isEdit ? S.current.edit_product : S.current.create_product,
                style: AppTextStyle.bold16(color: AppColors.current.textTitle),
              ),
              kSpacingHeight12,
              AppTextFormField(
                required: true,
                title: S.current.name_product,
                autoValidate: true,
                validator: (value) => emptyValidator(_nameCtrl.text),
                controller: _nameCtrl,
                fillColor: AppColors.current.neutralBlack1100.withValues(
                  alpha: 0.15,
                ),
              ),
              kSpacingHeight12,
              AppTextFormField(
                required: true,
                title: S.current.price_product,
                autoValidate: true,
                inputType: TextInputType.number,
                validator: (value) => emptyValidator(_priceCtrl.text),
                controller: _priceCtrl,
                fillColor: AppColors.current.neutralBlack1100.withValues(
                  alpha: 0.15,
                ),
              ),
              kSpacingHeight12,
              AppTextFormField(
                required: true,
                title: S.current.description_short,
                autoValidate: true,
                validator: (value) => emptyValidator(_descCtrl.text),
                controller: _descCtrl,
                fillColor: AppColors.current.neutralBlack1100.withValues(
                  alpha: 0.15,
                ),
              ),
              kSpacingHeight12,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    S.current.status_repo_order,
                    style: AppTextStyle.semiBold16(
                      color: AppColors.current.textTitle,
                    ),
                  ),
                  SizedBox(
                    child: Switch.adaptive(
                      value: _inStock,
                      trackOutlineWidth: WidgetStateProperty.all(0),
                      activeThumbColor: Colors.white,
                      activeTrackColor: AppColors.current.primaryDefault,
                      inactiveThumbColor: Colors.white,
                      inactiveTrackColor: Colors.grey,
                      onChanged: (value) {
                        setState(() {
                          _inStock = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
              Text(
                _inStock ? S.current.show_in_stock : S.current.show_out_stock,
                style: AppTextStyle.regular12(
                  color: _inStock
                      ? AppColors.current.green500
                      : AppColors.current.red500,
                ),
              ),
              kSpacingHeight24,
              AppButton(
                label: isEdit ? S.current.save : S.current.create,
                onPressed: _onSave,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
