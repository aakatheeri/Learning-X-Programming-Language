package dvm;

// This interface has a limited set of coins to be used.
public interface Coins {
	public static final Coin QUARTER = new Coin(0.25d, "25 Fils", "resources/025.png");
	public static final Coin HALF = new Coin(0.5d, "50 Fils", "resources/050.png");
	public static final Coin ONE_DIRHAM = new Coin(1d, "1 Dirhams", "resources/100.png");
}
