package dvm;

//This interface has a limited set of Optional Extras to be used.
public interface Options {
	public static final Option BLANK_OPTION = new Option("", 0, "");
	public static final Option SUGER = new Option("With Suger", 1, "resources/sugar.png");
	public static final Option EXTRA_STRONG = new Option("Extra Strong", 2, "resources/extrastrong.png");
}
