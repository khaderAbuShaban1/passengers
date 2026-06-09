// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Oromo (`om`).
class AppLocalizationsOm extends AppLocalizations {
  AppLocalizationsOm([String locale = 'om']) : super(locale);

  @override
  String get driverApp => 'Wedit Konkolaataa';

  @override
  String get driverHome => 'Mana';

  @override
  String get goOnline => 'Online Ta\'i';

  @override
  String get goOffline => 'Offline Ta\'i';

  @override
  String get youAreOnline => 'Online Jirta';

  @override
  String get youAreOffline => 'Offline Jirta';

  @override
  String get newRideRequest => 'Gaaffii Imaltuu Haaraa';

  @override
  String get acceptRide => 'Fudhachuu';

  @override
  String get declineRide => 'Diduu';

  @override
  String get seconds => 'Sekondii';

  @override
  String get timeLeft => 'Yeroo Hafee';

  @override
  String get passengerName => 'Imaltuu';

  @override
  String get pickupLocation => 'Bakka Ka\'umsa';

  @override
  String get dropoffLocation => 'Bakka Galgalaa';

  @override
  String get offeredPrice => 'Gatii Dhiyaate';

  @override
  String get enterYourPrice => 'Gatii Kee Galchi';

  @override
  String get navigateToPickup => 'Bakka Ka\'umsa Deemi';

  @override
  String get arrived => 'Gaheen';

  @override
  String get startRide => 'Imala Jalqabi';

  @override
  String get completeRide => 'Imala Xumuri';

  @override
  String get rideEarnings => 'Galii Imala';

  @override
  String get todayEarnings => 'Galii Har\'aa';

  @override
  String get weeklyEarnings => 'Galii Torban';

  @override
  String get monthlyEarnings => 'Galii Ji\'a';

  @override
  String get totalEarnings => 'Galii Waligalaa';

  @override
  String get subscriptionStatus => 'Haala Miseensummaa';

  @override
  String get subscriptionExpires => 'Xumurama';

  @override
  String get renewSubscription => 'Miseensummaa Haaromsi';

  @override
  String get dailyPlan => 'Karoora Guyyaa';

  @override
  String get weeklyPlan => 'Karoora Torban';

  @override
  String get monthlyPlan => 'Karoora Ji\'a';

  @override
  String get planPrice => 'Gatii Karoora';

  @override
  String get autoRenew => 'Of-haaromsuu';

  @override
  String get payWithChapa => 'Chapa Tiin Kafali';

  @override
  String get payWithTelebirr => 'Telebirr Tiin Kafali';

  @override
  String get bankTransfer => 'Dabarsaa Baankii';

  @override
  String get uploadReceipt => 'Rasiidhii Ol-kaa\'i';

  @override
  String get waitingApproval => 'Hayyama Eegaa Jira';

  @override
  String get registrationTitle => 'Galmee Konkolaataa';

  @override
  String get uploadDocuments => 'Dokumentoota Ol-kaa\'i';

  @override
  String get nationalId => 'Eenyummaa Biyyaalessaa';

  @override
  String get driverLicense => 'Hayyama Konkolachisaa';

  @override
  String get vehicleInfo => 'Odeeffannoo Konkolaataa';

  @override
  String get plateNumber => 'Lakkoofsa Pleetii';

  @override
  String get vehicleModel => 'Moodeelii Konkolaataa';

  @override
  String get vehicleYear => 'Waggaa Konkolaataa';

  @override
  String get vehicleColor => 'Halluu Konkolaataa';

  @override
  String get vehicleType => 'Gosa Konkolaataa';

  @override
  String get pendingApproval => 'Hayyama Eegaa';

  @override
  String get applicationStatus => 'Haala Iyyataa';

  @override
  String get preferredDestination => 'Bakka Galgalaa Filataame';

  @override
  String get setDestination => 'Bakka Galgalaa Qindeessi';

  @override
  String get destinationEnabled => 'Filtera Galgalaa Hojjata';

  @override
  String get destinationDisabled => 'Filtera Galgalaa Hojjachuu Dhabee';

  @override
  String get leaderboardTitle => 'Dorgommii Badhaasaa';

  @override
  String get myRank => 'Sadarkaa Koo';

  @override
  String get ridesThisWeek => 'Imala Torban Kana';

  @override
  String get prizes => 'Badhaasota';

  @override
  String get firstPlace => 'Sadarkaa 1ffaa';

  @override
  String get secondPlace => 'Sadarkaa 2ffaa';

  @override
  String get thirdPlace => 'Sadarkaa 3ffaa';

  @override
  String get raffleEligible => 'Qaxalee Irratti Mijataa';

  @override
  String get raffleConditions => 'Haala Qaxalii';

  @override
  String get ridesNeeded => 'Imala Barbaachisu';

  @override
  String get invitesNeeded => 'Affeerraa Barbaachisu';

  @override
  String get pastWinners => 'Mo\'attoota Darbe';

  @override
  String get shareRank => 'Sadarkaa Koo Qoodi';

  @override
  String get yourRankWidget => 'Sadarkaa Kee';

  @override
  String get profileTitle => 'Profaayilii Koo';

  @override
  String get totalRides => 'Imala Waligalaa';

  @override
  String get rating => 'Sadarkaa';

  @override
  String get referralCode => 'Koodii Referaalii';

  @override
  String get shareReferral => 'Referaalii Qoodi';

  @override
  String get logout => 'Ba\'i';

  @override
  String get settings => 'Qindaa\'ina';

  @override
  String get welcomeBack => 'Baga Deebitee';

  @override
  String get enterPhone => 'Lakkoofsa Bilbilaa Galchi';

  @override
  String get phoneHint => '‎+251 9XX XXX XXX';

  @override
  String get sendOtp => 'OTP Ergi';

  @override
  String get enterOtp => 'OTP Galchi';

  @override
  String get verifyOtp => 'Mirkaneessi';

  @override
  String get resendOtp => 'OTP Irra Ergi';

  @override
  String otpSentTo(String phone) {
    return 'OTP gara $phone ergame';
  }

  @override
  String get personalInfo => 'Odeeffannoo Dhuunfaa';

  @override
  String get fullName => 'Maqaa Guutuu';

  @override
  String get licenseNumber => 'Lakkoofsa Hayyamaa';

  @override
  String get licenseExpiry => 'Yeroo Xumura Hayyamaa';

  @override
  String get reviewAndSubmit => 'Ilaali fi Dhiyeessi';

  @override
  String get submitRegistration => 'Galmee Dhiyeessi';

  @override
  String get registrationSubmitted => 'Galmeen Dhiyaatee!';

  @override
  String get tapToUpload => 'Ol-kaa\'uuf tuqi';

  @override
  String get photoUploaded => 'Suuraan ol-ka\'ee';

  @override
  String get selectVehicleType => 'Gosa Konkolaataa Filadhu';

  @override
  String get sedan => 'Seedaan';

  @override
  String get suv => 'SUV';

  @override
  String get minibus => 'Minibusii';

  @override
  String get weekly => 'Torbaniin';

  @override
  String get monthly => 'Ji\'aan';

  @override
  String get today => 'Har\'a';

  @override
  String get allTime => 'Yeroo Maraa';

  @override
  String get earnings => 'Galii';

  @override
  String get ridesCount => 'Imala';

  @override
  String get averagePerRide => 'Galii Giddugalaa';

  @override
  String get noEarningsYet => 'Galii Ammallee Hin Jiru';

  @override
  String get activeSubscription => 'Miseensummaa Hojjataa';

  @override
  String get noActiveSubscription => 'Miseensummaa Hojjataa Hin Jiru';

  @override
  String get selectPaymentMethod => 'Gosa Kafaltii Filadhu';

  @override
  String get copyAccountNumber => 'Lakkoofsa Herreega Qoqi';

  @override
  String get copied => 'Qoqame!';

  @override
  String get bankDetails => 'Hundee Baankii';

  @override
  String get accountNumber => 'Lakkoofsa Herreega';

  @override
  String get bankName => 'Maqaa Baankii';

  @override
  String get notifications => 'Beeksisota';

  @override
  String get language => 'Afaan';

  @override
  String get sosButton => 'Yeroo Ariifannaa';

  @override
  String get callPassenger => 'Imaltutti Bilbili';

  @override
  String distanceAway(String distance) {
    return '$distance km fagaatu';
  }

  @override
  String get estimatedPrice => 'Gatii Tilmaamame';

  @override
  String get yourOffer => 'Dhiyeessii Kee';
}
