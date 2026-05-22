CLASS zcl_02_eml_wlp DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_02_EML_WLP IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
  DATA update_tab tYPE tABLE FOR upDATE /DMO/R_AgencyTP.
  update_tab = VALUE #( ( AgencyID = '070002'  Name = 'MODIFIED Agency'  ) ).

    MODIFY ENTITIES OF /DMO/R_AgencyTP
      ENTITY /DMO/Agency
        UPDATE FIELDS ( name )
          WITH update_tab.

  commit enTITIES.


  ENDMETHOD.
ENDCLASS.
