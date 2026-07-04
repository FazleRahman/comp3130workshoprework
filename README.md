# comp3130 Workshop Rework
Done by Fazle Rahman
ID: 47809663

## Week 1
went by pretty smooth, but the starting was horrendous as i am abroad for family emergency and I do not have my personal computer on me so I had to do the entire setup from the beginning and that ate up more than a day. But after that was smooth sailing. 

## Week 2
pretty easy as well as it was just making designs, and I excel at that as that is what i do in my free time. For question 2, could not make the mock-up exactly the same as i didn't find the resources so i added in a bit of my flare.

### Time update:
My time: 2:20AM, July 2nd 2026
Syd time: 6:20AM, July 2nd 2026

## Week 3
I use Duolingo regularly, so i am pretty used to it. Opened it up, noticed a couple things noticable, and asked about them in the servey. 
https://mqedu.qualtrics.com/jfe/form/SV_abjS4DPCy35dx0q

## Week 4
For this week, we were given the option to make a travel expenses app of make the one through the link. I chose the later as that would be easier and faster for the moment. Started it up properly, created the project. Added the button to go to the next randomized word. Made it prettier but adding padding around randomized word & a Card behind it to add layering. Used a theme to make the app prettier. Changed the styling of the randomized word. Fixed up accessibility issue like text to speech will now pronounce "cheaphead" instead of an "f" instead of the "ph" (tested it myself it works). added the navigation rail, made it such that if small screen, shows only icons, if big screen, shows name next to icons. Put a placeholder on the favourites page while i worked on it. Created teh favourites page.

## Week 5
Started the travel expenses app by creating a new Flutter project and implementing the required `Expenses` stateful widget in `main.dart` and  returned a `Scaffold` with a centered `Column`. Created `lib/models/expense_model.dart` with an `Expense` class, a `Category` enum, and `uuid` for unique IDs. Built an `ExpensesList` stateless widget to render the list of expenses using `ListView.builder`.I looked at the question and idk why it was said to add the 2 expenses from the beginning, but i followed through and hardcoded them into the `_ExpensesState` class and passed them to the expenses list. And lastly I replaced the placeholder text with the actual expenses list and created card-style expense items for each entry.

## Week 6
Expanded the travel expenses app with better expense cards, formatted dates, and a modal form for adding new expenses. Added the `AppBar` with the title and an add-expenses `IconButton` to open a bottom sheet where one can add expenses. Improved expense cards by showing category icons, formatted dates, and a more polished card layout. Updated `Expense` model to include icon mapping for each category. Created a `NewExpense` stateful widget for modal input. Added title and amount `TextField`s with a `$` prefix and numeric keyboard. Included a `Cancel` button to close the modal and an icon button to open `showDatePicker`. Captured the selected date in state and displayed it in the modal form.

## week 7
Extended the travel expenses app with category selection, validation, add/remove expense support, dismissible cards, and theme improvements. Added a category dropdown in the new expense modal and loaded it from the `Category` enum. Captured the selected category in state and displayed the chosen value in the modal. Implemented input validation with a `submitExpense` function and error dialogs for empty or invalid values. Passed an `addExpense` callback from `Expenses` to `NewExpense` so new entries are added to the main expense list. Wrapped expense list items in `Dismissible` widgets to support swipe-to-delete behavior. Added a remove handler with a callback from the parent widget and a `SnackBar` for feedback. Updated app theming and card styling for a more polished UI, including dark appearance support.

## week 8
Added application state management to the travel expenses app using the `provider` package and improved delete behavior. Added `provider` as a dependency and created a central `ExpensesState` class that extends `ChangeNotifier`. Moved expense list state into `ExpensesState` with methods for adding, removing, and retrieving expenses. Wrapped the app in `ChangeNotifierProvider` so child widgets can access the shared state. Updated `Expenses`, `ExpensesList`, and `NewExpense` to use `Consumer`/`Provider.of` for expense data and actions. Added a delete button on each expense card and wired it to a confirmation modal before removal. 
Special: there is a delete button, but expenses can also be deleted by swiping to the right. Learned it while playing around a couple days back trying to learn a couple things.

## week 9
i had already created a widget test file, i updated it with proper test to check if all widgets are running properly or not; correct behaviour. 
Created lib/utils/expense_utils.dart, and test/expense_test.dart for the Unit tests, to test the logic behind the scenes.

## week 10
added firebase authentication. Connecting directly from google firebase was showing up with some issues so I went into the terminal, ran flutterfire, logged in to firebase through terminal and connected my firebase through there directly into the application. 

# Finishing Notes
I have completed all weekly workshop tasks, from week 1 to week 10. 
Week 11 workshop task was updating on our progress, so i do not know much on what to do about that
Week 12 and 13 has nothing in it. 

# Thank you for this Opportunity to get some extra marks