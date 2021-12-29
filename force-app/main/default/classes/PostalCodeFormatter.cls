/**
 * @author Icaro - TOPi
 */
public class PostalCodeFormatter {

    public class InvalidInputException extends Exception {}

    public String formatPostalCode(String postalCode) {

        if(postalCode == null) return null;

        if (postalCode.length() != 8) throw new InvalidInputException('Postal Code should have length 8');

        return postalCode.substring(0, 5) + '-' + postalCode.substring(5, 8);

    }

}
