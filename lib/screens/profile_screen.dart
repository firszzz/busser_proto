import 'package:flutter/material.dart';

import '../widget/profile_field.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Профиль",
          style: TextStyle(
              fontWeight: FontWeight.w600
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.only(top: 10, bottom: 125, left: 16, right: 16),
        children: [
          const ProfileField(
            text: "Имя",
            labelText: "Артем",
          ),
          const ProfileField(
            text: "Фамилия",
            labelText: "Борисов",
          ),
          const ProfileField(
            text: "Отчество",
            labelText: "Андреевич",
          ),
          const ProfileField(
            text: "Номер паспорта",
            labelText: "0123 456789",
          ),
          const ProfileField(
            text: "Адрес прописки (для оформления заказов на перевозку)",
            labelText: "ул. Пушкина, д. 54",
          ),
          const ProfileField(
            text: "Телефон",
            labelText: "7(909)-999-99-99",
          ),
          const ProfileField(
            text: "Пароль",
            labelText: "Введите новый пароль",
          ),
          const SizedBox(
            height: 35,
          ),
          FractionallySizedBox(
            widthFactor: 0.75,
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                color: Colors.black87,
                border: Border.all(
                    width: 2.5
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: ElevatedButton(
                onPressed: () {

                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black54,
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                ),
                child: const Text(
                  "Сохранить",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 35,
          ),
          FractionallySizedBox(
            widthFactor: 0.75,
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                color: Colors.black87,
                border: Border.all(
                    width: 2.5
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: ElevatedButton(
                onPressed: () {
                  
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black54,
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                ),
                child: const Text(
                  "Удалить аккаунт",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
