class Slide {
  final String title;
  final String description;
  String image;

  Slide({required this.title, required this.description, required this.image});
}

final slideList = [
  Slide(
    title: 'Закажите',
    description:
        'Сеть из 30 магазинов по всему Минску в одном приложении. Вы оформляете заказ.',
    image: 'assets/images/onboarding/order.svg',
  ),
  Slide(
    title: 'Ожидайте',
    description:
        'Емеля собирает и доставляет вам заказ от 10 минут с 9:00 до 23:00',
    image: 'assets/images/onboarding/await.svg',
  ),
  Slide(
      title: 'Наслаждайтесь',
      description:
          'Вы экономите свое время и получаете свежие продукты прямо домой.',
      image: 'assets/images/onboarding/enjoy.svg'),
];
