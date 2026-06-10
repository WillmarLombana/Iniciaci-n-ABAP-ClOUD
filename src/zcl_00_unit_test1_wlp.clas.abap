CLASS zcl_00_unit_test1_wlp DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_00_unit_test1_wlp IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    CONSTANTS c_carrier_id TYPE /dmo/carrier_id VALUE 'LH'.

    TRY.
        DATA(carrier) = NEW lcl_carrier( c_carrier_id ).

        out->write( |Carrier { carrier->get_name( ) } has currency { carrier->get_currency( ) }| ).

      CATCH cx_abap_invalid_value INTO DATA(invalid).

        out->write( |Carrier { c_carrier_id } does not exist| ).

    ENDTRY.

  ENDMETHOD.
ENDCLASS.
