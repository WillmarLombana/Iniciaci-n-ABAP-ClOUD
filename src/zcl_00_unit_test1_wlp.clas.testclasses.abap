CLASS ltcl_teste DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    METHODS test_get_name FOR TESTING RAISING cx_static_check.
    METHODS test_currency FOR TESTING.
    METHODS setup.

    DATA currier TYPE REF TO lcl_carrier.
ENDCLASS.


CLASS ltcl_teste IMPLEMENTATION.

  METHOD setup.

    SELECT SINGLE
    FROM /dmo/carrier
    FIELDS carrier_id
    INTO @DATA(carrier_id).

    IF carrier_id IS INITIAL.
      cl_abap_unit_assert=>skip( msg = 'No data in /DMO/CARRIER' detail = 'Test requires at least one entry in DB table /DMO/CARRIER' ).
    ENDIF.

    TRY.
        me->currier = NEW lcl_carrier( carrier_id ).
      CATCH cx_abap_invalid_value INTO DATA(cx_invalid_value).
        cl_abap_unit_assert=>fail( msg = 'Cannot create the instance of class lcl_carrier' ).
    ENDTRY.

    cl_abap_unit_assert=>assert_bound( act = me->currier msg = 'Cannot create the instance of class lcl_carrier' ).
  ENDMETHOD.

  METHOD test_currency.
    cl_abap_unit_assert=>assert_not_initial( act = me->currier->get_currency( ) msg = 'Cannot get the currency' quit = if_abap_unit_constant=>quit-no ).
  ENDMETHOD.

  METHOD test_get_name.
    cl_abap_unit_assert=>fail( 'Implement your first test here' ).
  ENDMETHOD.

ENDCLASS.
