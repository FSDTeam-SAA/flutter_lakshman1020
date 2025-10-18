import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_lakshman1020/core/constants/app_colors.dart';
import 'package:flutter_lakshman1020/core/widgets/app_scaffold.dart';
import 'package:flutter_lakshman1020/core/widgets/custom_appbar.dart';
import 'package:flutter_lakshman1020/core/widgets/primary_button.dart';
import '../../../../core/constants/app_icons.dart';
import '../../models/app_text_styles.dart';
import '../controllers/load_controller.dart';
import '../../data/repositories/load_repository_impl.dart';

class RequestInformationScreen extends StatefulWidget {
  const RequestInformationScreen({super.key});

  @override
  State<RequestInformationScreen> createState() => _RequestInformationScreenState();
}

class _RequestInformationScreenState extends State<RequestInformationScreen> {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  // Text controllers for date & time fields
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _pickupController = TextEditingController();
  final TextEditingController _deliveryController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();

  late final LoadController _loadController;
  String _categorySelected = 'Medicine';
  String _companySelected = 'Default';

  Future<void> _pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: TColors.primary, // header & confirm color
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        _dateController.text =
        "${picked.day.toString().padLeft(2, '0')} ${_monthName(picked.month)} ${picked.year}";
      });
    }
  }

  Future<void> _pickTime(BuildContext context) async {
    final TimeOfDay? picked =
    await showTimePicker(context: context, initialTime: selectedTime ?? TimeOfDay.now());
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
        _timeController.text = picked.format(context);
      });
    }
  }

  String _monthName(int month) {
    const months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    return months[month - 1];
  }

  @override
  Widget build(BuildContext context) {
    // initialize controller lazily
    _loadController = Get.put(LoadController(repository: LoadRepositoryImpl()));

    return AppScaffold(
      appBar: CustomAppBar(
        title: "Request for a truck",
        onBack: () => Navigator.pop(context),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Center(
                child: Text(
                  "Book Your Trusted Truck",
                  style: TTextStyles.title,
                ),
              ),
              const SizedBox(height: 8),
              Center(
                child: Text(
                  "Fast, safe, and insured shifting — from medicine to furniture",
                  style: TTextStyles.subtitle,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 48),

              // Product Title
              _buildTextField(
                label: "Product Title",
                hint: "Ex: Medical Equipment for student..",
                controller: _titleController,
              ),
              const SizedBox(height: 16),

              // Description
              _buildTextField(
                label: "Description",
                hint:
                "Ex: 3 sealed cartons of medical supplies. Fragile and time-sensitive. Handle with care",
                maxLines: 3,
                controller: _descriptionController,
              ),
              const SizedBox(height: 16),

              // Category
              _buildDropdown(label: "Category", items: ["Medicine", "Furniture"], value: _categorySelected, onChanged: (v){ if(v!=null) setState(()=>_categorySelected=v); }),
              const SizedBox(height: 16),

              // Company
              _buildDropdown(label: "Company", items: ["Default", "Company A"], value: _companySelected, onChanged: (v){ if(v!=null) setState(()=>_companySelected=v); }),
              const SizedBox(height: 32),

              // Pickup Location
              _buildTextField(
                label: "Pickup Location",
                hint: "Green Road, Panthopath",
                suffixAsset: AppIcons.location,
                controller: _pickupController,
              ),
              const SizedBox(height: 12),

              // Delivery Location
              _buildTextField(
                label: "Delivery Location",
                hint: "Sayednagar B block, Vatara",
                suffixAsset: AppIcons.location,
                controller: _deliveryController,
              ),
              const SizedBox(height: 16),

              // Add Stoppage
              _buildTextField(
                label: "Add Stoppage",
                hint: "Ex: Banani Road No. 11",
                suffixAsset: AppIcons.addstopies,
              ),
              const SizedBox(height: 16),

              // Pickup Date & Time with Pickers
              Row(
                children: [
                  Expanded(
                    child: _buildTextField(
                      label: "Pickup Date",
                      hint: "Select date",
                      controller: _dateController,
                      prefixAsset: AppIcons.calendar,
                      readOnly: true,
                      onTap: () => _pickDate(context),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildTextField(
                      label: "Pickup Time",
                      hint: "Select time",
                      controller: _timeController,
                      prefixAsset: AppIcons.clock,
                      readOnly: true,
                      onTap: () => _pickTime(context),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Special Note
              _buildTextField(
                label: "Special note",
                hint:
                "This delivery contains fragile and time-sensitive medical supplies. Ensure temperature control if required, avoid…",
                maxLines: 3,
                controller: _noteController,
              ),
              const SizedBox(height: 20),

              // Submit Button
              context.primaryButton(
                text: "Request for a Truck",
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required String hint,
    String? suffixAsset,
    String? prefixAsset,
    int maxLines = 1,
    TextEditingController? controller,
    bool readOnly = false,
    VoidCallback? onTap,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TTextStyles.label),
        const SizedBox(height: 6),
        TextField(
          controller: controller,
          readOnly: readOnly,
          onTap: onTap,
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TTextStyles.hint,

            // Prefix icon support
            prefixIcon: prefixAsset != null
                ? Padding(
              padding: const EdgeInsets.all(12),
              child: Image.asset(prefixAsset, width: 18, height: 18),
            )
                : null,

            // Suffix icon support (as before)
            suffixIcon: suffixAsset != null
                ? Padding(
              padding: const EdgeInsets.all(12),
              child: Image.asset(suffixAsset, width: 18, height: 18),
            )
                : null,

            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            contentPadding:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
          ),
        ),
      ],
    );
  }


  Widget _buildDropdown({
    required String label,
    required List<String> items,
    String? value,
    ValueChanged<String?>? onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TTextStyles.label),
        const SizedBox(height: 6),
        DropdownButtonFormField<String>(
          value: value ?? items.first,
          items: items.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
          onChanged: onChanged ?? (v) {},
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            contentPadding:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
          ),
        ),
      ],
    );
  }
}
