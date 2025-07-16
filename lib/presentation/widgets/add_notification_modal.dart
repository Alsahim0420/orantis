import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../app/theme/app_theme.dart';
import '../bloc/notifications/notifications_bloc.dart';
import '../../domain/entities/prayer_notification.dart';

class AddNotificationModal extends StatefulWidget {
  final PrayerNotification? notification;

  const AddNotificationModal({super.key, this.notification});

  @override
  State<AddNotificationModal> createState() => _AddNotificationModalState();
}

class _AddNotificationModalState extends State<AddNotificationModal> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _bodyController = TextEditingController();

  TimeOfDay _selectedTime = const TimeOfDay(hour: 8, minute: 0);
  PrayerType _selectedPrayerType = PrayerType.coronilla;
  List<bool> _selectedDays = [
    true,
    true,
    true,
    true,
    true,
    true,
    true
  ]; // Todos los días por defecto
  bool _isActive = true;

  @override
  void initState() {
    super.initState();
    if (widget.notification != null) {
      final notification = widget.notification!;
      _titleController.text = notification.title;
      _bodyController.text = notification.body;
      _selectedTime =
          TimeOfDay(hour: notification.hour, minute: notification.minute);
      _selectedPrayerType = notification.prayerType;
      _selectedDays = List.from(notification.daysOfWeek);
      _isActive = notification.isActive;
    } else {
      _bodyController.text = 'Es hora de rezar';
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _bodyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(28),
          topRight: Radius.circular(28),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Drag handle
          Container(
            margin: const EdgeInsets.only(top: 16, bottom: 12),
            width: 50,
            height: 5,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.2),
              borderRadius: BorderRadius.circular(3),
            ),
          ),

          // Header
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        gradient: AppTheme.primaryGradient,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: AppTheme.primaryBlue.withOpacity(0.3),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Icon(
                        widget.notification != null ? Icons.edit : Icons.add,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.notification != null
                                ? 'Editar Notificación'
                                : 'Nueva Notificación',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color:
                                      Theme.of(context).colorScheme.onSurface,
                                ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            'Configura tu recordatorio de oración',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSurface
                                      .withOpacity(0.6),
                                ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Form
          Flexible(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Título
                    TextFormField(
                      controller: _titleController,
                      decoration: InputDecoration(
                        labelText: 'Título',
                        hintText: 'Ej: Rezar Coronilla',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        prefixIcon: const Icon(Icons.title),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor ingresa un título';
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 16),

                    // Mensaje
                    TextFormField(
                      controller: _bodyController,
                      decoration: InputDecoration(
                        labelText: 'Mensaje',
                        hintText: 'Ej: Es hora de rezar',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        prefixIcon: const Icon(Icons.message),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor ingresa un mensaje';
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 16),

                    // Tipo de oración
                    Text(
                      'Tipo de Oración',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 8),
                    DropdownButtonFormField<PrayerType>(
                      value: _selectedPrayerType,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        prefixIcon: const Icon(Icons.favorite),
                      ),
                      items: PrayerType.values.map((type) {
                        return DropdownMenuItem(
                          value: type,
                          child: Text(
                            _getPrayerTypeName(type),
                            overflow: TextOverflow.ellipsis,
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        if (value != null) {
                          setState(() {
                            _selectedPrayerType = value;
                          });
                        }
                      },
                    ),

                    const SizedBox(height: 16),

                    // Hora
                    Text(
                      'Hora',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 8),
                    InkWell(
                      onTap: _selectTime,
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context)
                                .colorScheme
                                .outline
                                .withOpacity(0.3),
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.access_time),
                            const SizedBox(width: 12),
                            Text(
                              _selectedTime.format(context),
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Días de la semana
                    Text(
                      'Días de la semana',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 8),
                    _buildDaysSelector(),

                    const SizedBox(height: 16),

                    // Activo/Inactivo
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Activar notificación',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                        Switch(
                          value: _isActive,
                          onChanged: (value) {
                            setState(() {
                              _isActive = value;
                            });
                          },
                          activeColor: AppTheme.primaryBlue,
                        ),
                      ],
                    ),

                    const SizedBox(height: 24),

                    // Botones
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () => Navigator.of(context).pop(),
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: const Text('Cancelar'),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: _saveNotification,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppTheme.primaryBlue,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: Text(
                              widget.notification != null
                                  ? 'Actualizar'
                                  : 'Guardar',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDaysSelector() {
    final days = ['Lun', 'Mar', 'Mié', 'Jue', 'Vie', 'Sáb', 'Dom'];

    return Column(
      children: [
        Row(
          children: List.generate(7, (index) {
            return Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedDays[index] = !_selectedDays[index];
                  });
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    color: _selectedDays[index]
                        ? AppTheme.primaryBlue
                        : Theme.of(context).colorScheme.surface,
                    border: Border.all(
                      color: _selectedDays[index]
                          ? AppTheme.primaryBlue
                          : Theme.of(context)
                              .colorScheme
                              .outline
                              .withOpacity(0.3),
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    days[index],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: _selectedDays[index]
                          ? Colors.white
                          : Theme.of(context).colorScheme.onSurface,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () {
                  setState(() {
                    _selectedDays = [true, true, true, true, true, true, true];
                  });
                },
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text('Todos'),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: OutlinedButton(
                onPressed: () {
                  setState(() {
                    _selectedDays = [
                      true,
                      true,
                      true,
                      true,
                      true,
                      false,
                      false
                    ];
                  });
                },
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text('Laborables'),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: OutlinedButton(
                onPressed: () {
                  setState(() {
                    _selectedDays = [
                      false,
                      false,
                      false,
                      false,
                      false,
                      true,
                      true
                    ];
                  });
                },
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text('Fines'),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Future<void> _selectTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  String _getPrayerTypeName(PrayerType type) {
    switch (type) {
      case PrayerType.coronilla:
        return 'Coronilla';
      case PrayerType.rosario:
        return 'Rosario';
      case PrayerType.novenaInmaculada:
        return 'Inmaculada Concepción';
      case PrayerType.novenaSanJose:
        return 'San José';
      case PrayerType.novenaGuadalupe:
        return 'Virgen de Guadalupe';
      case PrayerType.novenaMisericordia:
        return 'Divina Misericordia';
      case PrayerType.novenaSanAntonio:
        return 'San Antonio';
      case PrayerType.novenaFatima:
        return 'Virgen de Fátima';
    }
  }

  void _saveNotification() {
    if (_formKey.currentState!.validate()) {
      final notification = PrayerNotification(
        id: widget.notification?.id ??
            DateTime.now().millisecondsSinceEpoch.toString(),
        title: _titleController.text,
        body: _bodyController.text,
        hour: _selectedTime.hour,
        minute: _selectedTime.minute,
        daysOfWeek: _selectedDays,
        prayerType: _selectedPrayerType,
        isActive: _isActive,
      );

      if (widget.notification != null) {
        context.read<NotificationsBloc>().add(UpdateNotification(notification));
      } else {
        context.read<NotificationsBloc>().add(AddNotification(notification));
      }

      Navigator.of(context).pop();
    }
  }
}
