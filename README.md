KMTabSlider
===========

A custom view with a slider that allows for a user to tap or slide to the next control value.

Implement the KMTabSliderDelegate Protocol and the method below will give the KMStatus enum index of which item is selected:

<code>
 -(void)KMTabSlider:(KMTabSlider *)KMTabSlider itemSelected:(KMStatus)itemSelected{
 
     NSLog(@"%d", itemSelected);
     
 }
</code>
