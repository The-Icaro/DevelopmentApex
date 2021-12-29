/**
 * @author Icaro - TOPi
 */
@isTest
public class PostalCodeFormatterTest {
    
    @isTest
    public static void givenPostalCodeWhenFormatThenReturnFormattedPostalCode() {

        String postalToFormat = '12460000';

        PostalCodeFormatter formatter = new PostalCodeFormatter();

        String postalFormatted = formatter.formatPostalCode(postalToFormat);

        System.assert(String.isNotEmpty(postalFormatted));
        System.assertEquals('12460-000', postalFormatted);

    }

}
