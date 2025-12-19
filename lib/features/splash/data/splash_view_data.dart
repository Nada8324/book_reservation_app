import 'package:book_reservation_app/core/utils/assets_data.dart';
import 'package:book_reservation_app/features/splash/presentaion/view_models/splash_view_model.dart';

final splashScreensData = [
  SplashData(
      image: AssetsData.splash1,
      title: 'Welcome to Bookly! Your Next Adventure Awaits',
      description:
          'Embark on a literary journey with AI-curated book recommendations that match your unique tastes for an adventure in every read.',
      firstButton: 'Continue',
      secondButton: 'Skip to login'),
  SplashData(
      image: AssetsData.splash2,
      title: 'Discover +50 Million International Books Now',
      description:
          'Venture beyond borders with over 50 million books. Your next favorite read, from every corner of the world, awaits.',
      firstButton: 'Continue',
      secondButton: 'Skip to login'),
  SplashData(
      image: AssetsData.splash3,
      title: 'Crafted For You: Your Personal Book Oasis',
      description:
          'Let AI be your guide through a landscape of literature designed to match your unique taste and interests.',
      firstButton: 'Start My Adventure',
      secondButton: 'Back to start'),
];
