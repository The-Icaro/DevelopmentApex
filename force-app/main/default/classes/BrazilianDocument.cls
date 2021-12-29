public class BrazilianDocument {

    public BrazilianDocumentValidator validator;
    public BrazilianDocumentFormatter formatter;

    public String document;

    public BrazilianDocument() {
        validator = new BrazilianDocumentValidator();
        formatter = new BrazilianDocumentFormatter();
    }

    public BrazilianDocument(String document) {
        this();
        this.document = document;
    }

    public boolean isValid () {
        return isCpf ()  || isCnpj();
    }

    public boolean isCpf () {
        if (String.isEmpty(this.document)) return false;
        
        return validator.isCpf (this.document);
    }

    public boolean isCnpj () {

        if (String.isEmpty(this.document)) return false;

        return validator.isCNPJ (this.document);
    }

    public String getFormattedCpnj () {

        if (String.isEmpty(this.document)) return null;

        return formatter.formatCNPJ(this.document);
    }

    public String getFormattedCpf () {

        if (String.isEmpty(this.document)) return null;

        return formatter.formatCPF(this.document);
    }

}