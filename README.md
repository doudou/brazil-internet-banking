A VM to be able to use a banking website in Brazil

Yes ... Brazil banks decided to all (most ? At least mine does ...) use a Java
applet as their main mean of authentication. Of course, said applet does not
work on every combination of browser and Java version.

After fiddling one afternoon, trying to get it to work on modern installations,
I decided to get the big guns out and re-learn Vagrant (I was in a "docker"
phase). That's the result. With this, you can get a pristine VM into which you
can ssh -X and get the login to work. On whichever machine you are.

It is tested on Vagrant 1.6+. Just git clone and do

```
vagrant up
```
