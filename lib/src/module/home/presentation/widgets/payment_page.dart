import 'package:flutter/material.dart';

class PaymentMethodSelector extends StatefulWidget {
  final Function(String)? onPaymentMethodSelected;
  final Function(String)? onBankSelected;

  const PaymentMethodSelector({
    Key? key,
    this.onPaymentMethodSelected,
    this.onBankSelected,
  }) : super(key: key);

  @override
  State<PaymentMethodSelector> createState() => _PaymentMethodSelectorState();
}

class _PaymentMethodSelectorState extends State<PaymentMethodSelector> {
  bool isBankTransferExpanded = true;
  String? selectedBank;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              const SizedBox(height: 20),
              _buildBankTransferSection(),
              const SizedBox(height: 16),
              _buildOtherPaymentMethods(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.arrow_back_ios, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        const SizedBox(width: 8),
        const Text(
          'Payment',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget _buildBankTransferSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            setState(() {
              isBankTransferExpanded = !isBankTransferExpanded;
            });
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Bank Transfer',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Transform.rotate(
                angle: isBankTransferExpanded ? -1.57 : 0, 
                child: Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                ),
              ),
            ],
          ),
        ),
        if (isBankTransferExpanded) ...[
          const SizedBox(height: 16),
          _buildBankList(),
          const SizedBox(height: 16),
          Center(
            child: TextButton(
              onPressed: () {},
              child: const Text(
                'Show More',
                style: TextStyle(
                  color: Colors.pink,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildBankList() {
    final banks = [
      {
        'name': 'Bank Central Asia',
        'logo': 'assets/bca_logo.png',
      },
      {
        'name': 'Bank Negara Indonesia',
        'logo': 'assets/bni_logo.png',
      },
      {
        'name': 'Bank Mandiri',
        'logo': 'assets/mandiri_logo.png',
      },
      {
        'name': 'Bank Rakyat Indonesia',
        'logo': 'assets/bri_logo.png',
      },
    ];

    return Column(
      children: banks.map((bank) => _buildBankItem(bank)).toList(),
    );
  }

  Widget _buildBankItem(Map<String, String> bank) {
    final isSelected = selectedBank == bank['name'];

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isSelected ? Colors.pink.shade100 : Colors.grey.shade200,
          width: 1,
        ),
      ),
      child: ListTile(
        leading: SizedBox(
          width: 40,
          height: 40,
          child: Image.asset(
            bank['logo']!,
            errorBuilder: (context, error, stackTrace) =>
                Icon(Icons.account_balance, color: Colors.blue[900]),
          ),
        ),
        title: Text(
          bank['name']!,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: const Text(
          'Checked Automatically',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),
        ),
        trailing: Radio<String>(
          value: bank['name']!,
          groupValue: selectedBank,
          onChanged: (value) {
            setState(() {
              selectedBank = value;
            });
            widget.onBankSelected?.call(value!);
          },
          activeColor: Colors.pink,
        ),
      ),
    );
  }

  Widget _buildOtherPaymentMethods() {
    return Column(
      children: [
        _buildPaymentMethodItem(
          'Credit/Debit Card',
          Icons.credit_card,
          onTap: () => widget.onPaymentMethodSelected?.call('card'),
        ),
        const SizedBox(height: 12),
        _buildPaymentMethodItem(
          'Paypal',
          Icons.paypal,
          onTap: () => widget.onPaymentMethodSelected?.call('paypal'),
        ),
      ],
    );
  }

  Widget _buildPaymentMethodItem(String title, IconData icon,
      {VoidCallback? onTap}) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}
