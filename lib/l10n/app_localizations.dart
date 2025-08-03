import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_wo.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es'),
    Locale('fr'),
    Locale('wo')
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'SpendWise'**
  String get appTitle;

  /// No description provided for @hello.
  ///
  /// In en, this message translates to:
  /// **'Hello'**
  String get hello;

  /// No description provided for @summaryFinance.
  ///
  /// In en, this message translates to:
  /// **'This is your finance summary'**
  String get summaryFinance;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @about.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// No description provided for @planning.
  ///
  /// In en, this message translates to:
  /// **'Planning'**
  String get planning;

  /// No description provided for @statistic.
  ///
  /// In en, this message translates to:
  /// **'statistic'**
  String get statistic;

  /// No description provided for @balance.
  ///
  /// In en, this message translates to:
  /// **'Balance'**
  String get balance;

  /// No description provided for @deposit.
  ///
  /// In en, this message translates to:
  /// **'Deposit'**
  String get deposit;

  /// No description provided for @withdrawal.
  ///
  /// In en, this message translates to:
  /// **'Withdrawal'**
  String get withdrawal;

  /// No description provided for @amount.
  ///
  /// In en, this message translates to:
  /// **'Amount'**
  String get amount;

  /// No description provided for @spent.
  ///
  /// In en, this message translates to:
  /// **'Spent'**
  String get spent;

  /// No description provided for @remaining.
  ///
  /// In en, this message translates to:
  /// **'Remaining'**
  String get remaining;

  /// No description provided for @pleaseEnterAmountInvalid.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid amount'**
  String get pleaseEnterAmountInvalid;

  /// No description provided for @pleaseEnterAmount.
  ///
  /// In en, this message translates to:
  /// **'  Please enter an amount'**
  String get pleaseEnterAmount;

  /// No description provided for @description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get description;

  /// No description provided for @pleaseEnterDescription.
  ///
  /// In en, this message translates to:
  /// **'Please enter a description'**
  String get pleaseEnterDescription;

  /// No description provided for @date.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get date;

  /// No description provided for @startDate.
  ///
  /// In en, this message translates to:
  /// **'Start Date'**
  String get startDate;

  /// No description provided for @endDate.
  ///
  /// In en, this message translates to:
  /// **'End Date'**
  String get endDate;

  /// No description provided for @selectDate.
  ///
  /// In en, this message translates to:
  /// **'Select Date'**
  String get selectDate;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @pleaseSelectCategory.
  ///
  /// In en, this message translates to:
  /// **'Please select a category'**
  String get pleaseSelectCategory;

  /// No description provided for @lastTransactions.
  ///
  /// In en, this message translates to:
  /// **'Last Transactions'**
  String get lastTransactions;

  /// No description provided for @graphicView.
  ///
  /// In en, this message translates to:
  /// **'Graphic View'**
  String get graphicView;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @category.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get category;

  /// No description provided for @categories.
  ///
  /// In en, this message translates to:
  /// **'Categories'**
  String get categories;

  /// No description provided for @noPlanning.
  ///
  /// In en, this message translates to:
  /// **'No planning'**
  String get noPlanning;

  /// No description provided for @newPlanning.
  ///
  /// In en, this message translates to:
  /// **'New Planning'**
  String get newPlanning;

  /// No description provided for @createFirstPlanning.
  ///
  /// In en, this message translates to:
  /// **'Create your first planning'**
  String get createFirstPlanning;

  /// No description provided for @createPlanning.
  ///
  /// In en, this message translates to:
  /// **'Create Planning'**
  String get createPlanning;

  /// No description provided for @addPlanning.
  ///
  /// In en, this message translates to:
  /// **'Add Planning'**
  String get addPlanning;

  /// No description provided for @emptyTransaction.
  ///
  /// In en, this message translates to:
  /// **'No transaction to display'**
  String get emptyTransaction;

  /// No description provided for @newTransations.
  ///
  /// In en, this message translates to:
  /// **'New Transactions'**
  String get newTransations;

  /// No description provided for @transactions.
  ///
  /// In en, this message translates to:
  /// **'Transactions'**
  String get transactions;

  /// No description provided for @manageCategories.
  ///
  /// In en, this message translates to:
  /// **'Manage Categories'**
  String get manageCategories;

  /// No description provided for @addCategory.
  ///
  /// In en, this message translates to:
  /// **'Add Category'**
  String get addCategory;

  /// No description provided for @createCategory.
  ///
  /// In en, this message translates to:
  /// **'Create Category'**
  String get createCategory;

  /// No description provided for @editCategory.
  ///
  /// In en, this message translates to:
  /// **'Edit Category'**
  String get editCategory;

  /// No description provided for @deleteCategory.
  ///
  /// In en, this message translates to:
  /// **'Delete Category'**
  String get deleteCategory;

  /// No description provided for @splashText.
  ///
  /// In en, this message translates to:
  /// **'Manage your finances with ease'**
  String get splashText;

  /// No description provided for @day.
  ///
  /// In en, this message translates to:
  /// **'Day'**
  String get day;

  /// No description provided for @week.
  ///
  /// In en, this message translates to:
  /// **'Week'**
  String get week;

  /// No description provided for @month.
  ///
  /// In en, this message translates to:
  /// **'Month'**
  String get month;

  /// No description provided for @year.
  ///
  /// In en, this message translates to:
  /// **'Year'**
  String get year;

  /// No description provided for @noData.
  ///
  /// In en, this message translates to:
  /// **'No data'**
  String get noData;

  /// No description provided for @noDataDescription.
  ///
  /// In en, this message translates to:
  /// **'Add transactions to view statistics'**
  String get noDataDescription;

  /// No description provided for @transactionEvolution.
  ///
  /// In en, this message translates to:
  /// **'Transaction evolution'**
  String get transactionEvolution;

  /// No description provided for @breakdown.
  ///
  /// In en, this message translates to:
  /// **'Breakdown'**
  String get breakdown;

  /// No description provided for @appDescription.
  ///
  /// In en, this message translates to:
  /// **'SpendWise is a personal finance management application that allows you to easily track your expenses and income.'**
  String get appDescription;

  /// No description provided for @features.
  ///
  /// In en, this message translates to:
  /// **'Features'**
  String get features;

  /// No description provided for @featureTransactionManagement.
  ///
  /// In en, this message translates to:
  /// **'Transaction Management'**
  String get featureTransactionManagement;

  /// No description provided for @featureTransactionDescription.
  ///
  /// In en, this message translates to:
  /// **'Add, edit and delete your expenses and income with categorization.'**
  String get featureTransactionDescription;

  /// No description provided for @featureDashboard.
  ///
  /// In en, this message translates to:
  /// **'Dashboard'**
  String get featureDashboard;

  /// No description provided for @featureDashboardDescription.
  ///
  /// In en, this message translates to:
  /// **'Overview of your finances with balance, deposits and withdrawals.'**
  String get featureDashboardDescription;

  /// No description provided for @featureCategoryManagement.
  ///
  /// In en, this message translates to:
  /// **'Category Management'**
  String get featureCategoryManagement;

  /// No description provided for @featureCategoryDescription.
  ///
  /// In en, this message translates to:
  /// **'Default and custom categories to organize your transactions.'**
  String get featureCategoryDescription;

  /// No description provided for @featureBudgets.
  ///
  /// In en, this message translates to:
  /// **'Budgets'**
  String get featureBudgets;

  /// No description provided for @featureBudgetsDescription.
  ///
  /// In en, this message translates to:
  /// **'Create and track your budgets by category with alerts.'**
  String get featureBudgetsDescription;

  /// No description provided for @featureStatistics.
  ///
  /// In en, this message translates to:
  /// **'Detailed Statistics'**
  String get featureStatistics;

  /// No description provided for @featureStatisticsDescription.
  ///
  /// In en, this message translates to:
  /// **'Bar and pie charts to analyze your expenses and income.'**
  String get featureStatisticsDescription;

  /// No description provided for @featureDateFilters.
  ///
  /// In en, this message translates to:
  /// **'Date Filters'**
  String get featureDateFilters;

  /// No description provided for @featureDateFiltersDescription.
  ///
  /// In en, this message translates to:
  /// **'Analyze your finances by day, week, month or year.'**
  String get featureDateFiltersDescription;

  /// No description provided for @featureTheme.
  ///
  /// In en, this message translates to:
  /// **'Customizable Theme'**
  String get featureTheme;

  /// No description provided for @featureLanguage.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get featureLanguage;

  /// No description provided for @featureLanguageDescription.
  ///
  /// In en, this message translates to:
  /// **'Switch between English and French seamlessly.'**
  String get featureLanguageDescription;

  /// No description provided for @featureThemeDescription.
  ///
  /// In en, this message translates to:
  /// **'Light and dark modes for optimal visual comfort.'**
  String get featureThemeDescription;

  /// No description provided for @featureLocalStorage.
  ///
  /// In en, this message translates to:
  /// **'Local Storage'**
  String get featureLocalStorage;

  /// No description provided for @featureLocalStorageDescription.
  ///
  /// In en, this message translates to:
  /// **'Data stored locally for full privacy.'**
  String get featureLocalStorageDescription;

  /// No description provided for @developer.
  ///
  /// In en, this message translates to:
  /// **'Developer'**
  String get developer;

  /// No description provided for @developerTitle.
  ///
  /// In en, this message translates to:
  /// **'Cheikh Oumar DIALLO'**
  String get developerTitle;

  /// No description provided for @developerSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Engineering student at EPT'**
  String get developerSubtitle;

  /// No description provided for @copyright.
  ///
  /// In en, this message translates to:
  /// **'© 2024 SpendWise. All rights reserved.'**
  String get copyright;

  /// No description provided for @enterName.
  ///
  /// In en, this message translates to:
  /// **'Please enter a name'**
  String get enterName;

  /// No description provided for @add.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get add;

  /// No description provided for @noCategory.
  ///
  /// In en, this message translates to:
  /// **'No category'**
  String get noCategory;

  /// No description provided for @addYourFirstCategory.
  ///
  /// In en, this message translates to:
  /// **'Add your first category'**
  String get addYourFirstCategory;

  /// No description provided for @defaultCategory.
  ///
  /// In en, this message translates to:
  /// **'Default category'**
  String get defaultCategory;

  /// No description provided for @customCategory.
  ///
  /// In en, this message translates to:
  /// **'Category created by you'**
  String get customCategory;

  /// No description provided for @deleteConfirmationTitle.
  ///
  /// In en, this message translates to:
  /// **'Confirm deletion'**
  String get deleteConfirmationTitle;

  /// No description provided for @deleteConfirmationContent.
  ///
  /// In en, this message translates to:
  /// **'Do you really want to delete?'**
  String get deleteConfirmationContent;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @restoreDefaultCategories.
  ///
  /// In en, this message translates to:
  /// **'Restore default categories'**
  String get restoreDefaultCategories;

  /// No description provided for @restoreDefaultCategoriesConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Do you want to restore the default categories? This will delete all custom categories.'**
  String get restoreDefaultCategoriesConfirmation;

  /// No description provided for @error.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get error;

  /// No description provided for @restoreCategoryError.
  ///
  /// In en, this message translates to:
  /// **'Error while restoring categories:'**
  String get restoreCategoryError;

  /// No description provided for @restore.
  ///
  /// In en, this message translates to:
  /// **'Restore'**
  String get restore;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'es', 'fr', 'wo'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'es': return AppLocalizationsEs();
    case 'fr': return AppLocalizationsFr();
    case 'wo': return AppLocalizationsWo();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
