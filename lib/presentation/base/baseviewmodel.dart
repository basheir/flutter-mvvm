abstract class BaseViewModel extends BaseviewmodelIput with BaseviewmodelOutput {
  // shared properties and methods that will be used by all view models
    
}

abstract class BaseviewmodelIput {
  void init(); // This will be called when the view model is created
  void dispose(); // This will be called when the view model is destroyed
}

mixin BaseviewmodelOutput {
  
}