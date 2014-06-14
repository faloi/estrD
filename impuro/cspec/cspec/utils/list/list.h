/*
 * list.h
 *
 *  Created by: Federico Scarpa
 */

#ifndef LIST_H_
#define LIST_H_

    typedef struct cspec_list cspec_list_t;

    cspec_list_t* cspec_list_create();

    void cspec_list_destroy_and_destroy_elements(cspec_list_t** self, void(*destroyer)(void*));
    void cspec_list_destroy(cspec_list_t** self);

    void cspec_list_clean(cspec_list_t* self);
    void cspec_list_do(cspec_list_t* self, void(*procedure)(void*));
    void cspec_list_sort_by(cspec_list_t* self, int(*comparator)(void*, void*));

    cspec_list_t* cspec_list_select(cspec_list_t* self, int(*criterion)(void*));
    cspec_list_t* cspec_list_collect(cspec_list_t* self, void*(*transformation)(void*));
    cspec_list_t* cspec_list_append(cspec_list_t* list1, cspec_list_t* list2);

    void cspec_list_add(cspec_list_t* self, void* data);
    void cspec_list_add_first(cspec_list_t* self, void* data);
    void cspec_list_add_last(cspec_list_t* self, void* data);
    void cspec_list_add_by(cspec_list_t* self, void* data, int(*condition)(void*, void*));

    void* cspec_list_get_first(cspec_list_t* self);
    void* cspec_list_get_last(cspec_list_t* self);

    void* cspec_list_get_at(cspec_list_t* self, int index);
    void* cspec_list_detect_and_remove(cspec_list_t* self, int(*criterion)(void*));

    void* cspec_list_remove_first(cspec_list_t* self);

    void* cspec_list_detect(cspec_list_t* self, int(*criterion)(void*));

    void* cspec_list_reduce(cspec_list_t* self, void*(*operation)(void*, void*), void* initial_value);
    int cspec_list_is_empty(cspec_list_t* self);

    int cspec_list_any_satisfy(cspec_list_t* self, int(*criterion)(void*));
    int cspec_list_all_satisfy(cspec_list_t* self, int(*criterion)(void*));

    int cspec_list_includes(cspec_list_t* self, int(*criterion)(void*));
    int cspec_list_get_length(cspec_list_t* self);

#endif /* LIST_H_ */
