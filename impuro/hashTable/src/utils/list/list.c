/*
 * list.c
 *
 *  Created by: Federico Scarpa
 */

// ----------------------------------------------------------------------------------------------------
// ----- Includes -----
// ----------------------------------------------------------------------------------------------------

    #include "list.h"
    #include <stdlib.h>
    #include <string.h>

	#define TRUE 	1
	#define FALSE 	0

    #define MEMORY_ALLOC_TYPE(type) malloc(sizeof(type))
    #define MEMORY_ALLOC_SIZE(size) malloc(size)

    #define MEMORY_FREE(p_some)         \
        if (p_some != NULL) {           \
            free(p_some);               \
            p_some = NULL;              \
        }                               \


// ----------------------------------------------------------------------------------------------------
// ----- Defines -----
// ----------------------------------------------------------------------------------------------------

    typedef struct node {
        void* data;
        struct node* next;
    } __cspec_node_t;

    struct cspec_list {
        __cspec_node_t* head;
        int  length;
    };

    #define FOR_EACH(p_node, list)                                              \
		__cspec_node_t* p_node;                                                 \
        for (p_node = list->head; !__cspec_node_is_null(p_node); p_node = p_node->next) \

// ----------------------------------------------------------------------------------------------------
// ----- Private Functions Declaration -----
// ----------------------------------------------------------------------------------------------------

    __cspec_node_t* __cspec_node_create(void* data);

    void* __cspec_node_destroy(__cspec_node_t** self);

    int __cspec_node_is_null(__cspec_node_t* node);
    int __cspec_node_has_next(__cspec_node_t* node);

    void* __cspec_node_return_null_or_data(__cspec_node_t* self);



    void __cspec_list_link_nodes(cspec_list_t* self, __cspec_node_t* node, __cspec_node_t* node_to_add);

    void* __cspec_list_unlink_nodes(cspec_list_t* self, __cspec_node_t* prev, __cspec_node_t* next);

    __cspec_node_t* __cspec_list_get_last_node(cspec_list_t* self);
    __cspec_node_t* __cspec_list_get_first_node(cspec_list_t* self);

// ----------------------------------------------------------------------------------------------------
// ----- Public Functions Definition -----
// ----------------------------------------------------------------------------------------------------

    // ----- CONSTRUCTOR ------------------------------------------------------------------------------

    cspec_list_t* cspec_list_create() {
        cspec_list_t* self = MEMORY_ALLOC_TYPE(cspec_list_t);
        self->head = NULL;
        self->length = 0;
        return self;
    }

    // ----- DESTROYERS -------------------------------------------------------------------------------

    void cspec_list_destroy_and_destroy_elements(cspec_list_t** self, void(*destroyer)(void*)) {
        while (!cspec_list_is_empty(*self)) {
            destroyer(cspec_list_remove_first(*self));
        }
        MEMORY_FREE(*self);
    }

    void cspec_list_destroy(cspec_list_t** self) {
        cspec_list_clean(*self);
        MEMORY_FREE(*self);
    }

    void cspec_list_clean(cspec_list_t* self) {
        while (!cspec_list_is_empty(self)) {
            cspec_list_remove_first(self);
        }
    }

    // ----- HIGHER ORDER -----------------------------------------------------------------------------

    void cspec_list_do(cspec_list_t* self, void(*procedure)(void*)) {
        FOR_EACH(aux_node, self) {
            procedure(aux_node->data);
        }
    }

    cspec_list_t* cspec_list_select(cspec_list_t* self, int(*criterion)(void*)) {
        cspec_list_t* selected = cspec_list_create();
        void do_select (void* data) {
            if (criterion(data)) cspec_list_add(selected, data);
        }
        cspec_list_do(self, do_select);
        return selected;
    }

    cspec_list_t* cspec_list_collect(cspec_list_t* self, void*(*transformation)(void*)) {
        cspec_list_t* collected = cspec_list_create();
        void do_collect (void* data) {
            cspec_list_add(collected, transformation(data));
        }
        cspec_list_do(self, do_collect);
        return collected;
    }

    int cspec_list_any_satisfy(cspec_list_t* self, int(*criterion)(void*)) {
        FOR_EACH(aux_node, self) {
            if (criterion(aux_node->data)) return TRUE;
        }
        return FALSE;
    }

    int cspec_list_all_satisfy(cspec_list_t* self, int(*criterion)(void*)) {
        FOR_EACH(aux_node, self) {
            if (!criterion(aux_node->data)) return FALSE;
        }
        return TRUE;
    }

    int cspec_list_includes(cspec_list_t* self, int(*criterion)(void*)) {
        return cspec_list_any_satisfy(self, criterion);
    }

    void* cspec_list_detect(cspec_list_t* self, int(*criterion)(void*)) {
        FOR_EACH(aux_node, self) {
            if (criterion(aux_node->data)) break;
        }
        return __cspec_node_return_null_or_data(aux_node);
    }

    void* cspec_list_reduce(cspec_list_t* self, void*(*operation)(void*, void*), void* initial_value) {
        void* accum = initial_value;
        FOR_EACH(aux_node, self) {
            accum = operation(aux_node->data, accum);
        }
        return accum;
    }

    void cspec_list_sort_by(cspec_list_t* self, int(*comparator)(void*, void*)) {
        if (cspec_list_get_length(self) < 2) return;
        __cspec_node_t* prev_node;
        __cspec_node_t* next_node;
        for (prev_node = self->head; __cspec_node_has_next(prev_node); prev_node = prev_node->next) {
            for (next_node = prev_node->next; !__cspec_node_is_null(next_node); next_node = next_node->next) {
                if (!comparator(prev_node->data, next_node->data)) {
                    void* aux_node = prev_node->data;
                    prev_node->data = next_node->data;
                    next_node->data = aux_node;
                }
            }
        }
    }

    // ----- ADDING -----------------------------------------------------------------------------------

    void cspec_list_add(cspec_list_t* self, void* data) {
        cspec_list_add_last(self, data);
    }

    void cspec_list_add_first(cspec_list_t* self, void* data) {
        int always_true(void* __, void* ___) { return TRUE; }
        cspec_list_add_by(self, data, always_true);
    }

    void cspec_list_add_last(cspec_list_t* self, void* data) {
        int always_false(void* __, void* ___) { return FALSE; }
        cspec_list_add_by(self, data, always_false);
    }

    void cspec_list_add_by(cspec_list_t* self, void* data, int(*condition)(void*, void*)) {
        __cspec_node_t* prev_node = NULL;
        FOR_EACH(aux_node, self) {
            if (condition(data, aux_node->data)) break;
            prev_node = aux_node;
        }
        __cspec_list_link_nodes(self, prev_node, __cspec_node_create(data));
    }

    // ----- REMOVING ---------------------------------------------------------------------------------

    void* cspec_list_detect_and_remove(cspec_list_t* self, int(*criterion)(void*)) {
        __cspec_node_t* prev_node = NULL;
        FOR_EACH(aux_node, self) {
            if (criterion(aux_node->data)) break;
            prev_node = aux_node;
        }
        return __cspec_list_unlink_nodes(self, prev_node, aux_node);
    }

    void* cspec_list_remove_first(cspec_list_t* self) {
        int always_true(void* __) { return TRUE; }
        return cspec_list_detect_and_remove(self, always_true);
    }

    cspec_list_t* cspec_list_append(cspec_list_t* list1, cspec_list_t* list2) {
        void* do_append(void* data, void* list) {
            cspec_list_add_last(list, data);
            return list;
        }
        return cspec_list_reduce(list2, do_append, list1);
    }

    // ----- QUERIES ----------------------------------------------------------------------------------

    int cspec_list_is_empty(cspec_list_t* self) {
        return cspec_list_get_length(self) == 0;
    }

    // ----- GETTERS ----------------------------------------------------------------------------------

    void* cspec_list_get_first(cspec_list_t* self) {
        return __cspec_node_return_null_or_data(__cspec_list_get_first_node(self));
    }

    void* cspec_list_get_last(cspec_list_t* self) {
        return __cspec_node_return_null_or_data(__cspec_list_get_last_node(self));
    }

    void* cspec_list_get_at(cspec_list_t* self, int index) {
        if (index >= cspec_list_get_length(self)) return cspec_list_get_last(self);
        if (index < 0) return cspec_list_get_first(self);
        int i = 0;
        FOR_EACH(aux_node, self) {
            if (index == i++) break;
        }
        return __cspec_node_return_null_or_data(aux_node);
    }

    int cspec_list_get_length(cspec_list_t* self) {
        return self->length;
    }

// ----------------------------------------------------------------------------------------------------
// ----- Private Functions Definition -----
// ----------------------------------------------------------------------------------------------------

    __cspec_node_t* __cspec_node_create(void* data) {
        __cspec_node_t* self = MEMORY_ALLOC_TYPE(__cspec_node_t);
        self->data = data;
        self->next = NULL;
        return self;
    }

    void* __cspec_node_destroy(__cspec_node_t** self) {
        void* data = (*self)->data;
        MEMORY_FREE(*self);
        return data;
    }

    int __cspec_node_is_null(__cspec_node_t* node) {
        return node == NULL;
    }

    int __cspec_node_has_next(__cspec_node_t* node) {
        return node->next != NULL;
    }

    void* __cspec_node_return_null_or_data(__cspec_node_t* self) {
        return __cspec_node_is_null(self) ? NULL : self->data;
    }

    void __cspec_list_link_nodes(cspec_list_t* self, __cspec_node_t* node, __cspec_node_t* node_to_add) {
        if (__cspec_node_is_null(node)) {
            node_to_add->next = self->head;
            self->head = node_to_add;
        } else {
            node_to_add->next = node->next;
            node->next = node_to_add;
        }
        self->length++;
    }

    void* __cspec_list_unlink_nodes(cspec_list_t* self, __cspec_node_t* prev, __cspec_node_t* next) {
        if (__cspec_node_is_null(next)) return NULL;
        if (__cspec_node_is_null(prev)) {
            self->head = next->next;
        } else {
            prev->next = next->next;
        }
        self->length--;
        return __cspec_node_destroy(&next);
    }

    __cspec_node_t* __cspec_list_get_last_node(cspec_list_t* self) {
        __cspec_node_t* node = NULL;
        if (!cspec_list_is_empty(self)) {
            for (node = self->head; __cspec_node_has_next(node); node = node->next);
        }
        return node;
    }

    __cspec_node_t* __cspec_list_get_first_node(cspec_list_t* self) {
        return self->head;
    }

