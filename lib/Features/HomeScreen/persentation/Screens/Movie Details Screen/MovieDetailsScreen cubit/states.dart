abstract class MovieDetailsStates{}
class MovieDetailsInitState extends MovieDetailsStates{}

class MovieDetailsLoadingState extends MovieDetailsStates{}
class MovieDetailsErrorState extends MovieDetailsStates{}
class MovieDetailsSuccessState extends MovieDetailsStates{}

class LoadingSuggestionsState extends MovieDetailsStates{}
class ErrorSuggestionsState extends MovieDetailsStates{}
class SuccessSuggestionsState extends MovieDetailsStates{}