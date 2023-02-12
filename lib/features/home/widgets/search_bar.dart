part of '../home_screen.dart';

final List<String> searchableList = [
  "Member 1",
  "Member 2",
  "Member 3",
  "Member 4",
  "Member 5",
  "Member 6",
  "Member 7",
  "Member 8",
  "Member 9",
  "Member 10",
  "Member 11",
  "Member 12",
  "Member 13",
  "Member 14",
  "Member 15",
];
Widget searchWidget(String text) {
  return ListTile(
    title: Text(
      text,
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.indigoAccent),
    ),
  );
}

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: const Color.fromARGB(255, 240, 244, 245), borderRadius: BorderRadius.circular(4)),
      margin: const EdgeInsets.only(top: 10.0, left: 21, right: 21),
      child: AdvancedSearch(
        searchItems: searchableList,
        maxElementsToDisplay: 10,
        singleItemHeight: 50,
        borderColor: Colors.grey,
        minLettersForSearch: 0,
        selectedTextColor: const Color(0xFF3363D9),
        fontSize: 16,
        borderRadius: 4,
        hintText: 'Search',
        cursorColor: Colors.blueGrey,
        autoCorrect: false,
        focusedBorderColor: const Color(0xFF4285F4),
        searchResultsBgColor: const Color.fromARGB(255, 250, 250, 250),
        disabledBorderColor: Colors.cyan,
        enabledBorderColor: Colors.transparent,
        enabled: true,
        caseSensitive: false,
        inputTextFieldBgColor: const Color.fromARGB(255, 240, 244, 245),
        clearSearchEnabled: true,
        itemsShownAtStart: 10,
        searchMode: SearchMode.CONTAINS,
        showListOfResults: true,
        unSelectedTextColor: Colors.black54,
        verticalPadding: 10,
        horizontalPadding: 10,
        hideHintOnTextInputFocus: true,
        hintTextColor: Colors.grey,
        searchItemsWidget: searchWidget,
        onItemTap: (index, value) {
          //onTap
        },
        onSearchClear: () {
          //onSearchClear
        },
        onSubmitted: (value, value2) {
          //onSubmitt
        },
        onEditingProgress: (value, value2) {},
      ),
    );
  }
}
