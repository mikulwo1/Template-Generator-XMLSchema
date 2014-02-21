#!/usr/bin/perl 

use strict;
use warnings;

use Template;

my $tt    = Template->new( );
my $input = 'UBL-Invoice-2.1-Example.tt';
my $vars  = {
    Invoice => {
        UBLVersionID => "2.1",
        ID => "TOSL108",
        IssueDate => "2009-12-15",
        Notes => [
            {
                languageID => "en",
                ttext => "Ordered in our booth at the convention.",
            },
        ],
        TaxPointDate => "2009-11-30",
        DocumentCurrencyCode => {
            listID => "ISO 4217 Alpha",
            listAgencyID => "6",
            ttext => 'EUR',
        },
        AccountingCost => "Project cost code 123",
        InvoicePeriods => [
            {
                StartDate => "2009-11-01",
                EndDate => "2009-11-30",
            },
        ],
        OrderReference => {
                ID => '123',
        },
        ContractDocumentReferences => [
            {
                ID => 'Contract321',
                DocumentType => 'Framework agreement',
            },
        ],
        AdditionalDocumentReferences => [
            {
                ID => "Doc1",
                DocumentType => "Timesheet",
                Attachment => {
                    ExternalReference => {
                        URI => "http://www.suppliersite.eu/sheet001.html",
                    },
                },
            },
            {
                ID => "Doc2",
                DocumentType => "Drawing",
                Attachment => {
                    EmbeddedDocumentBinaryObject => {
                        mimeCode => "application/pdf",
                        ttext => "UjBsR09EbGhjZ0dTQUxNQUFBUUNBRU1tQ1p0dU1GUXhEUzhi",
                    },
                },
            },
        ],
    },
};

$tt->process($input, $vars)
    || die $tt->error( );
