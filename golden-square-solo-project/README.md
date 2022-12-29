# Ordering System

## User Stories
### User story 1
> As a customer  
> So that I can check if I want to order something  
> I would like to see a list of dishes with prices.
### User story 2
> As a customer  
> So that I can order the meal I want  
> I would like to be able to select some number of several available dishes.
### User story 3
> As a customer  
> So that I can verify that my order is correct  
> I would like to see an itemised receipt with a grand total.
### User story 4
> As a customer  
> So that I am reassured that my order will be delivered on time  
> I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered.

## Design Thinking
For **user story 1**, I created a `Menu` class which maintains an array of `Dish` objects. The `MenuFormatter` class is used to render the menu in a user-friendly way.

For **user story 2**, I created a `Cart` class which is very similar to the `Menu` class, but it takes `CartItem` objects.
In the current implementation `CartItem` objects are identical to `Dish` objects, however, in future versions of the ordering system, the `Dish` class could have attributes such as `imageUrl`, `description`, `stock_level`, etc and the `CartItem` class could have for example an `options` attribute.
The `CartFormatter` - similar to `MenuFormatter` - is used for the `Cart` presentation to the user.

For **user story 3**, I created the `Order` class. It uses a `Customer` object to take the customer's details and it has a `submit` method which marks the order as submitted. In a future implementation, `submit` could also be used to send the order to a back office UI used by the kitchen staff. As before, there's a formatter class: `OrderFormatter` used to show the itemised receipt with a grand total along with other details. (date, time, etc)

For **user story 4**, I utilised the Twilio platform. I created the `TwilioService` class which handles the connection and sends the SMS using the Twilio API. The `TextSender` class creates another layer of abstraction, essentially decoupling the Twilio API calls from the rest of the system. 
`DeliveryTextFormatter` creates the message to be sent via SMS. It extracts the order time from an `Order` object that is passed to it and uses the `DeliveryTime` class' `get_delivery_time` method to calculate an ETA for the order.
The `get_delivery_time` method in its current form, simply adds a default waiting time depending on the current time. This method could have been added to the `Order` class, but future implementations could be taking into account pending orders, the day of the week, time, etc, so it could potentially bloat the `Order` class with functionality that is not strictly related to the order process.

![enter image description here](https://github.com/realtnt/golden-square-solo-project/blob/main/design/OrderingSystemDesign-v0.8.png)

## Design Process
I followed the steps in the **Multi-Class Planned Design Recipe**. 

I started by reading the user stories and understanding what needs to be implemented. I used *Excalidraw* to visualise my design. This process took a substantial amount of time and many iterations until I reached a design that looked good enough to go to the next stage.

I wrote down the class interfaces, a process which led to some minor re-designs of the classes, their methods and attributes.

Finally, I made a list of integration tests and unit tests. This process also yielded some changes after finding some flaws in my initial design.

The whole process took more than half the time of the whole project, but once I had the design documentation, it was fairly quick to use the class interfaces and the tests to start implementing the functionality.

## Reflections
I made sure that I took enough time to create an initial design that I was happy with. I tried to think in terms of scalability and any future functionality that would be useful in an ordering system.

I started with quite a monolithic design, but I believe that I managed to break it down into classes in a way that would allow the addition of more features relatively easily.

Another reason for taking my time during this phase was to make sure that I didn't have to go back and make any major changes which would inevitably lead to a substantial delay.

However, despite the time I took, I found that there were still tweaks that I had to make to the way some classes or methods worked. In most cases that meant that I also had to tweak the tests in order to implement those changes. Having the tests helped to double-check that my changes didn't break anything else in the system.

Finally, creating a little tester program was a great way to validate that the design was fit for purpose but also helped to pick up some more tweaks that were needed and bugs. 

One major bug - which I hadn't thought of testing for - was that the `Cart#remove_item` method was removing all the instances of a `CartItem` from the cart, rather than just one at a time.

## Possible Improvements
I have already talked about functionality that could be added to make the whole system more useful. Here is a small list of possible improvements:
- Some features are in the design diagram in red. For example, stock levels for dishes, description and images.
- Mobile phone numbers are only considered valid if they have the following format: +447777111222. This could be changed to add the international code if the user enters their number like this: 07777111222
- At the moment `Dish`, `Customer` and `CartItem` are structs without any checking of the values passed.
- `DeliveryTime` could use a more intelligent approach.
- Option to choose different currencies.
